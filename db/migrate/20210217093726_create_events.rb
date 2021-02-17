# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.text :description
      t.belongs_to :place, index: true, foreign_key: true

      t.timestamps
    end

    add_reference :places, :event
    add_foreign_key :places, :events, column: :event_id
  end
end
