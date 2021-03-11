# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::Update do
  it "update event" do
    event = create(:event)
    described_class.new(event, { end_date: 2.days.from_now.to_date }).call

    expect(event.end_date.to_s).to eq(2.days.from_now.to_date.to_s)
  end
end
