class HomeController < ApplicationController
  def index
    # created instance variable in order to test the database on homepage
    @stations = Station.all.order(identifier: :asc)
    #@coords = Station.coordinates("42.3259949","42.3302883","-72.6256294","-72.6535561")
  end
end
