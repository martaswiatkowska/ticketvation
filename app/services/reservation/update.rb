# frozen_string_literal: true

class Reservation::Update
  def initialize(reservation, params)
    @reservation = reservation
    @params = params
  end

  def call
    @reservation.update(@params)
  end
end
