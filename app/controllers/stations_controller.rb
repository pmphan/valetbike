Stripe.api_key = ENV['STRIPE_SECRET_KEY']

class StationsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @stations = Station.all.order(name: :asc)
  end

  def show
    @station = Station.find_by(params[:identifier])
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
    )
  end

end
