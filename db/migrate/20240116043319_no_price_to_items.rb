class NoPriceToItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :price
  end
end
