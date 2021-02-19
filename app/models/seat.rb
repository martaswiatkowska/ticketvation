# frozen_string_literal: true

class Seat < ApplicationRecord
  belongs_to :place
  has_many :seat_reservations, dependent: :delete_all
  has_many :reservations, through: :seat_reservations
  
  def available?
    seat_reservations.count == 0
  end
end
