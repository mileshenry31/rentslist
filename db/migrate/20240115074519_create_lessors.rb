class CreateLessors < ActiveRecord::Migration[7.0]
  def change
    create_table :lessors do |t|

      t.timestamps
    end
  end
end
