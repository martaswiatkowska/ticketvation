# frozen_string_literal: true

class Place < ApplicationRecord
  has_many :events
  has_many :seats
end
