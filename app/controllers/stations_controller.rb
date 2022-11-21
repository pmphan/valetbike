Stripe.api_key = ENV['STRIPE_SECRET_KEY']

class StationsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @stations = Station.all.order(name: :asc)
  end

  def show
    @station = Station.find_by(params[:identifier])

    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    @checkout_session = current_user.payment_processor.checkout(
      mode: "payment",
      line_items: "price_1M6JG0B5WNqkNUpJOKH9i6vb",
    )
  end

end
