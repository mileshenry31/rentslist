class UserIdCard < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :user_id, :integer, index: true
  end
end
