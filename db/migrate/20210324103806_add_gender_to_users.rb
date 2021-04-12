class AddGenderToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :gender, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :avatar, :string, default: 'https://res.cloudinary.com/teekaytech/image/upload/v1617721019/npf_sj2ta5.png'
  end
end
