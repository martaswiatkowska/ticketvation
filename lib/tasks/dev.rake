# frozen_string_literal: true

namespace :dev do
  task prime: "db:setup" do
    puts "Creating Place"
    place = Place.create(name: "Super Uber Place", address: "Sesame Street 49/17 United State")
    Seat.create(row: "A", seat_number: 1, place: place)
    Seat.create(row: "A", seat_number: 2, place: place)
    Seat.create(row: "A", seat_number: 3, place: place)
    Seat.create(row: "A", seat_number: 4, place: place)
    Seat.create(row: "A", seat_number: 5, place: place)
    Seat.create(row: "A", seat_number: 6, place: place)
    Seat.create(row: "A", seat_number: 7, place: place)
    Seat.create(row: "A", seat_number: 8, place: place)
    Seat.create(row: "B", seat_number: 1, place: place)
    Seat.create(row: "B", seat_number: 2, place: place)
    Seat.create(row: "B", seat_number: 3, place: place)
    Seat.create(row: "B", seat_number: 4, place: place)
    Seat.create(row: "B", seat_number: 5, place: place)
    Seat.create(row: "B", seat_number: 6, place: place)
    Seat.create(row: "B", seat_number: 7, place: place)
    Seat.create(row: "B", seat_number: 8, place: place)
  end
end
