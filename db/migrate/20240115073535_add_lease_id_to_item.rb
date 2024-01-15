class AddLeaseIdToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :lease_id, :integer, index: true
  end
end
