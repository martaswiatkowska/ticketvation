# frozen_string_literal: true

require "rails_helper"

RSpec.describe Reservation::Create do
  it "save valid reservation in db" do
    reservation  = described_class.new(build(:reservation)).call

    expect(reservation).to be_persisted
  end
end
