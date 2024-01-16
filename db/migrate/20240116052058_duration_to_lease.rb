class DurationToLease < ActiveRecord::Migration[7.0]
  def change
    add_column :leases, :duration_days, :integer
  end
end
