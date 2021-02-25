# frozen_string_literal: true

require "test_helper"

class ReservationCreateTest < ActiveSupport::TestCase

  test "#create reservation test" do
    reservation = 
    service = Reservation::Create.new(reservation)

    assert_difference('Reservation.count') do
      assert service.call
    end
  end
end

