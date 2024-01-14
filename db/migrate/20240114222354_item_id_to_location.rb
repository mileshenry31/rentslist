class ItemIdToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :item_id, :integer, index: true
  end
end
