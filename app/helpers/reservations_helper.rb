# frozen_string_literal: true

module ReservationsHelper
  def seats_for_row(seats, row)
    seats.where(row: row)
  end
end
