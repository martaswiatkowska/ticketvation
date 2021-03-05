# frozen_string_literal: true

FactoryBot.define do
  factory :seat do
    sequence(:row) { |n| "#{n}" }
    sequence(:seat_number)  { |n| "#{n}" }
    place
  end
end
