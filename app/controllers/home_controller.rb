class HomeController < ApplicationController
  def index
    # created instance variable in order to test the database on homepage
    @stations = Station.all.order(identifier: :asc)
  end
end
