# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :place
  has_many :reservations


  scope :continues_in_date, ->(date) { where("start_date <= :date AND :date <= end_date", date: date) }
  scope :take_place, ->(place_name) { joins(:place).where("places.name = ?", place_name) }
  
  def free_seats_num
    place.seats_count - reservations_count 
  end
end
