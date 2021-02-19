require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservation(:one)  
  end

  test "creating a Reservation" do
    visit events_url
    click_on "Buy ticket"

    fill_in "Name", with: @reservation.name
    fill_in "Surname", with: @reservation.surname
    fill_in "Email", with: @reservation.email
    find("#reservation_seat_ids_1").click
    find("#reservation_seat_ids_2").click
    click "Create Reservation"
    assert_text "Pay for Reservation"
  end
end
