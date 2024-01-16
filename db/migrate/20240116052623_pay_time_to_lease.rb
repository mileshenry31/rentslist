class PayTimeToLease < ActiveRecord::Migration[7.0]
  def change
    add_column :leases, :all_at_once, :boolean
  end
end
