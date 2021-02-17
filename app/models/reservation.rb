# frozen_string_literal: true

class Reservation < ApplicationRecord
  enum status: {
    waiting_for_payment: "waiting_for_payment",
    confirmed: "confirmed"
  }

  belongs_to :event
  has_many :seat_reservations
  has_many :seats, through: :seat_reservations
end
