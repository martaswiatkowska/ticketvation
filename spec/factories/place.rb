# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    transient do
     seats_count { 0 } 
    end

    sequence(:name) { |n| "#{n} place" }
    sequence(:address)  { |n| "#{n} description" }
    
    factory :place_with_seats do
      seats { create_list(:seat, 10) }
    end
  end
end
