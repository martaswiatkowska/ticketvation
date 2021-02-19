class AddSeatCounterToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :seats_count, :integer
  end
end
