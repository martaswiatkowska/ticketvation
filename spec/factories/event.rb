# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    sequence(:name) { |n| "#{n} event" }
    sequence(:description)  { |n| "#{n} description" }
    start_date { 2.days.from_now }
    end_date { 10.days.from_now }
    place
  end
end
