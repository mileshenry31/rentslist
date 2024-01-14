class ZipIntToString < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :zip_code
    add_column :users, :zip_code, :string
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
