class ChangeDefaultType < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :default_location_id, :integer, index: true
  end
end
