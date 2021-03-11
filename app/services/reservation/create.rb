# frozen_string_literal: true

class Reservation::Create
  def initialize(reservation)
    @reservation = reservation
  end

  def call
    @reservation.status = :waiting_for_payment
    # TODO 15 put in env value
    # TODO tys should be counted in front
    @reservation.amount = 15 * @reservation.seats_count
    if @reservation.save
      Reservation::DeleteJob.set(wait_until: 15.minutes.from_now)
        .perform_later(@reservation)
      # TODO send email
    end
    @reservation
  end
end
