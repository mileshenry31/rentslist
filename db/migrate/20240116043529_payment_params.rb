class PaymentParams < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :price, :decimal, :precision => 8, :scale => 2
    add_column :payments, :item_id, :integer, index: true
    add_column :payments, :lease_id, :integer, index: true
  end
end
