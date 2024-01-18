class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :first_name
      t.string :last_name
      t.string :number
      t.string :month
      t.string :year
      t.string :verification_value

      t.timestamps
    end
  end
end
