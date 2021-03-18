# frozen_string_literal: true

require "rails_helper"

RSpec.feature EventsController, type: :controller do
  describe "get json data with proper params" do
    before {
      place = create(:place_with_seats, name: "ICE")
      place2 = create(:place_with_seats, name: "ICE2")
      create(:event, name: "Devoxx", start_date: 1.days.before,
             end_date: 3.days.from_now, place: place)
      create(:event, name: "Codest", start_date: 7.days.from_now,
             end_date: 9.days.from_now, place: place2)
      create(:event, name: "Devoxx2", start_date: 30.days.from_now,
             end_date: 33.days.from_now, place: place)
      create(:event, name: "Hackaton", start_date: 8.days.from_now,
             end_date: 31.days.from_now, place: place2)
    }

    it "event_data" do
      params = { filter: { event_date: Time.now } }
      json_sesponse = [{ name: "Devoxx" }].to_json
      get :event_list, params: params

      expect(response.body).to eq(json_sesponse)
    end

    it "place_name" do
      params = { filter: { place_name: "ICE" } }
      json_sesponse = [{ name: "Devoxx" }, { name: "Devoxx2" }].to_json
      get :event_list, params: params

      expect(response.body).to eq(json_sesponse)
    end

    it "event_date with seats_number grater than place seats" do
      params = { filter: { event_date: Time.now, seats_number: 14 } }
      json_sesponse = [].to_json
      
      get :event_list, params: params

      expect(response.body).to eq(json_sesponse)
    end
  
    it "event_name with seats_number less than place seats" do
      params = { filter: { event_date: 8.days.from_now, seats_number: 4 } }
      json_sesponse = [{ name: "Codest" }, { name: "Hackaton" }].to_json
      
      get :event_list, params: params

      expect(response.body).to eq(json_sesponse)
    end


    it "place_name with seats_number" do
      params = { filter: { place_name: Time.now, seats_number: 14 } }
      json_sesponse = [].to_json
      get :event_list, params: params

      expect(response.body).to eq(json_sesponse)
    end
  end
end
