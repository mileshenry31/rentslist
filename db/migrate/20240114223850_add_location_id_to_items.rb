class AddLocationIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :location_id, :integer, index: true
  end
end
