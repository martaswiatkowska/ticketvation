# frozen_string_literal: true

require "rails_helper"

RSpec.describe Reservation, type: :model do
  it { should belong_to :event }
  it { should have_many :seats }
  it { should validate_numericality_of :seats_count }
end
