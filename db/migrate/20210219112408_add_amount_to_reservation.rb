class AddAmountToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :amount, :decimal
  end
end
