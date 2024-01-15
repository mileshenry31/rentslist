class AddThingsToLease < ActiveRecord::Migration[7.0]
  def change
    add_column :leases, :lessee_id, :integer, index: true
    add_column :leases, :lessor_id, :integer, index: true
    add_column :leases, :item_id, :integer, index: true
  end
end
