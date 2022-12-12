Stripe.api_key = ENV['STRIPE_SECRET_KEY']

class CheckoutController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    if current_user.rented_bike
      flash[:alert] = "You are already renting a bike. Please cancel before renting."
      Rails.logger.debug "[ev] User tried to rent two bikes."
      redirect_to stations_path
    end

    bike_id = params[:bike_id]
    @bike = Bike.find_by_identifier(bike_id)
    if not @bike.status_free?
      flash[:alert] = "Bike is already taken! Please choose another."
      Rails.logger.debug "[ev] User tried to rent a taken bike."
      redirect_back(fallback_location: stations_path) 
    end

    begin
      product = Stripe::Product.retrieve('STANDARD_RIDE')
    rescue Stripe::InvalidRequestError => error
      flash[:alert] = "Something went wrong! Please choose another."
      Rails.logger.error "[!] Stripe: Retrieving product failed: #{error}"
      # Redirect to failure page
      redirect_to action: :index
      return
    end

    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    @checkout_session = current_user.payment_processor.checkout(
      mode: "payment",
      line_items: product.default_price,
      client_reference_id: bike_id,
      success_url: checkout_success_url,
    )
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @bike_id = @session[:client_reference_id]
    @bike = Bike.find_by(identifier: @bike_id)
    @bike.update(
      status: :reserved,
      current_user_id: current_user[:identifier]
    )
  end

  def cancel
    current_user.rented_bike.update(
      status: :free,
      current_user_id: nil
    )
  end
end
