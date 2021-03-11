# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::Create do
  it "save valid event in db" do
    event  = described_class.new(build(:event)).call

    expect(event).to be_persisted
  end
end
