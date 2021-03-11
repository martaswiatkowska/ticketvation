# frozen_string_literal: true

class Reservation < ApplicationRecord
  enum status: {
    waiting_for_payment: "waiting_for_payment",
    confirmed: "confirmed",
    canceled: "canceled"
  }

  belongs_to :event
  has_many :seat_reservations
  has_many :seats, through: :seat_reservations,
    counter_cache: :seats_count

  validates :seats_count, numericality: { even: true }
end
