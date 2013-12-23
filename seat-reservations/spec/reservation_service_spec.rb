require "minitest/autorun"
#require "test/unit"
require "./lib/reservation_service"

class ReservationServiceTest < Minitest::Test

  def setup
    @service = ReservationService.new
  end

  def test_reserving_seats_in_empty_carriage
    reserved_seat_numbers = @service.reserve(2)
    assert_equal [1,2], reserved_seat_numbers
  end

  def test_reserving_seats_in_non_empty_carriage
    @service.reserve(1)
    reserved_seat_numbers = @service.reserve(2)

    assert_equal [1,2,3], reserved_seat_numbers
  end

  def test_listing_when_no_reservations
    assert_equal [], @service.list_reserved()
  end

  def test_listing_reservations
    @service.reserve(1)
    @service.reserve(3)

    assert_equal [1,2,3,4], @service.list_reserved()
  end

end
