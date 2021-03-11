# frozen_string_literal: true

require "rails_helper"

RSpec.describe Seat, type: :model do
  it { should belong_to :place }
  it { should have_many :reservations }
end
