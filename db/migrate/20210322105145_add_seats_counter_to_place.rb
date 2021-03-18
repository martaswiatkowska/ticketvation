class AddSeatsCounterToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :seats_count, :integer
  end
end
