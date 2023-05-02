class AddActiveToCrimes < ActiveRecord::Migration[6.1]
  def change
    add_column :crimes, :active, :boolean, default: true
  end
end
