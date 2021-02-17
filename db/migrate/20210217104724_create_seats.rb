class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.text :row
      t.integer :seat_number
      t.belongs_to :place, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :places, :seat
  end
end
