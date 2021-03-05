# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation::Update do
  it "update reservation" do
    reservation  = create(:reservation)
    described_class.new(reservation, { status: :confirmed}).call
    
    expect(reservation).to be_confirmed
  end
end
