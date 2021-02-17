class Seat < ApplicationRecord
  belongs_to :place
  has_many :seat_reservations
  has_many :reservations, through: :seat_reservations
end
