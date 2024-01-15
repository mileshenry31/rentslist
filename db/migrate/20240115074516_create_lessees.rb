class CreateLessees < ActiveRecord::Migration[7.0]
  def change
    create_table :lessees do |t|

      t.timestamps
    end
  end
end
