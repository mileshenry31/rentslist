class LesLesId < ActiveRecord::Migration[7.0]
  def change
    add_column :lessees, :lease_id, :integer, index: true
    add_column :lessors, :lease_id, :integer, index: true
  end
end
