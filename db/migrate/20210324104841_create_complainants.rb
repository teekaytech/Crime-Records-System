class CreateComplainants < ActiveRecord::Migration[6.1]
  def change
    create_table :complainants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :surname
      t.string :firstname
      t.string :dob
      t.string :nationality
      t.string :address
      t.string :occupation
      t.string :phone
      t.string :gender
      t.boolean :criminal

      t.timestamps
    end
  end
end
