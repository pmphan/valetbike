require "test_helper"

class StationTest < ActiveSupport::TestCase

  def setup
    @station = Station.new(name: "Cool Station", address: "Nowhere")
  end

  test "valid" do
    assert @station.valid?
  end

  test "missing name" do
    @station.name = ""
    assert_not @station.valid?
  end

  test "missing address" do
    @station.address = ""
    assert_not @station.valid?
  end

  test "auto capacity" do
    assert_equal @station.capacity, 0
  end

  test "auto coords" do
    assert_equal @station.latitude, 0.0
    assert_equal @station.longitude, 0.0
  end

end
