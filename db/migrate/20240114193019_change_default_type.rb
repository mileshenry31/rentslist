class ChangeDefaultType < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :default_location
    add_column :users, :default_location_id, :integer, index: true
  end
end
