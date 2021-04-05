class CreateCrimes < ActiveRecord::Migration[6.1]
  def change
    create_table :crimes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :accuser
      t.string :accused
      t.string :unknown_others
      t.datetime :date
      t.string :statements

      t.timestamps
    end
  end
end
