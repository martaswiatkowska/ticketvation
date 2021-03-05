# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation::Delete do
  it "set canceled status" do
    reservation  = create(:reservation)
    described_class.new(reservation).call
    
    expect(reservation).to be_canceled
  end
end
