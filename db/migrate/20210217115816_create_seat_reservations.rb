# frozen_string_literal: true

class CreateSeatReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :seat_reservations do |t|
      t.belongs_to :seat, null: false, foreign_key: true
      t.belongs_to :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
