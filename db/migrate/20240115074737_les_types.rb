class LesTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :lessees, :user_id, :integer, index: true
    add_column :lessors, :user_id, :integer, index: true
  end
end
