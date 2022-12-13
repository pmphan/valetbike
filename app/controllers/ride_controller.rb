class RideController < ApplicationController
  before_action :authenticate_user!
  def index
    @rides = current_user.all_rides
    @active_ride = @rides.find_by_status(:active)
    @inactive_ride = @rides.status_finished
    # FIXME: Wonky logic due to deadline, fix soon
    # Add a reserve time field for ride
    if not @active_ride.present?
      @reserved_bike = current_user.rented_bike
    end
    Rails.logger.debug "Active Ride: #{@active_ride}"
  end

  def new
    Rails.logger.debug "[ev] Starting a ride."
    @bike = Bike.find_by_identifier(params[:bike_id])
    @ride = Ride.new(
      bike_id: params[:bike_id],
      user_id: params[:user_id],
      from_station: params[:from_station],
      start_time: Time.now
    )
    Rails.logger.debug "[ev] New ride #{@ride}"

    if current_user.all_rides.find_by(status: :active)
      Rails.logger.debug("[!] Ride not valid: #{@ride}")
      flash[:alert] = "Start ride failed! You have pending ride..."
      redirect_back(fallback_location: stations_path)
    else
      @ride.save
      @bike.update(
        status: :taken,
      )
      flash[:notice] = "Ride started!"
      redirect_to ride_index_path
    end
  end

  def cancel
    #TODO: Make this an ajax call
    Rails.logger.debug "[ev] End a ride."
    ride = Ride.find_by_identifier(params[:ride_id])
    ride.update(
      status: :finished,
      end_time: Time.now,
    )
    current_user.rented_bike.update(
      status: :free,
      current_user_id: nil
    )
    redirect_back(fallback_location: ride_index_path)
  end

  def statistic
    # SQL query for optimization and readability
    sql = "
      WITH calc_table(ride_length) AS (
        SELECT end_time - start_time
        FROM rides
        WHERE user_id = \"#{current_user[:identifier]}\"
              AND status = 1
      )
      SELECT AVG(ride_length) AS avg_ride_length,
             SUM(ride_length) AS total_ride_length,
             COUNT(*) AS total
      FROM calc_table;
    "
    result = Ride.find_by_sql(sql)
    puts result
    render json: {result: result}
  end
end
