class DeletePayment < ActiveRecord::Migration[7.0]
  def change
    drop_table :payments
  end
end
