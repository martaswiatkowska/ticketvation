# frozen_string_literal: true

class Reservation::Delete
  def initialize(reservation)
    @reservation = reservation
  end

  def call
    if @reservation.waiting_for_payment?
      @reservation.canceled!
      @reservation.seats.each { |s| s.reservation.delete_all }
    end
  end
end
