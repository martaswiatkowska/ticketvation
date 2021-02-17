class Reservation < ApplicationRecord
  belongs_to :event
  has_many :seat_reservations
  has_many :seats, through: :seat_reservations
end
