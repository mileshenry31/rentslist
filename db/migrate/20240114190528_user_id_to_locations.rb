class UserIdToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :user_id, :integer, index: true
  end
end
