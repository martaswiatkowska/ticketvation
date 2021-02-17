# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :status
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
