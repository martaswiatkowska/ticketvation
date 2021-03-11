# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Reservations", type: :feature do
  before(:each) do
    seats = create_list(:seat, 4, row: "A")
    place = create(:place, seats: seats)
    create(:event, place: place)
  end
  scenario "user can make reservation" do
    visit events_path

    click_on "Buy ticket"

    fill_in "Name", with: "Jhon"
    fill_in "Surname", with: "Novac"
    fill_in "Email", with: "aaaa@op.pl"
    match = find_all("input", id: /reservation_seat_ids_*/)
    match[1].click
    match[2].click

    click_on "Create Reservation"
    expect(page).to have_text("Pay for Reservation")
  end
end
