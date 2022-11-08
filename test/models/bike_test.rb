require "test_helper"

class BikeTest < ActiveSupport::TestCase

  def setup
    @bike = Bike.new
  end

  test "valid" do
    assert @bike.status_free?
    assert @bike.valid?
  end

  test "invalid status" do
    assert_raises ArgumentError do
      @bike.status = 10
    end
  end

  #TODO: Test relationships

end
