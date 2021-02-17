# frozen_string_literal: true

namespace :dev do
  task prime: "db:setup" do 
    puts "Creating Place"
    Place.create(name: "Super Uber Place", address: "Sesame Street 49/17 United State")
  end
end

