class DefaultLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :default_location, :location
  end
end
