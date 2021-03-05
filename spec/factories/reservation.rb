# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    sequence(:name) { |n| "User #{n} " }
    sequence(:surname) { |n| "Surname #{n}" }
    event
    seats { build_list(:seat, 2, row: "A") }
    seats_count { 2 }
    status { :waiting_for_payment }
  end
end
