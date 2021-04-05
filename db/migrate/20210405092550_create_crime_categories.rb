class CreateCrimeCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :crime_categories do |t|
      t.references :crime, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
