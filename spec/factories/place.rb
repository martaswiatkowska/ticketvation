# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    sequence(:name) { |n| "#{n} place" }
    sequence(:address)  { |n| "#{n} description" }
  end
end
