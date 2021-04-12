class AddActiveToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :active, :boolean, default: true
  end
end
