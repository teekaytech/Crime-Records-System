class AddGenderToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :gender, :date
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :occupation, :string
  end
end
