# frozen_string_literal: true

class Reservation::Create
  def initialize(reservation)
    @reservation = reservation
  end

  def call
    if @reservation.save
      # TODO add sidekick
      Reservation::DeleteJob.set(wait_until: 15.minutes.from_now)
        .perform_later(@reservation)
      # TODO send email
    end
    @reservation
  end
end
