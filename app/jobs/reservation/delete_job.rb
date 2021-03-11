# frozen_string_literal: true

class Reservation::DeleteJob < ApplicationJob
  queue_as :reservation

  def perform(reservation)
    Reservation::Delete.new(reservation).call
  end
end
