class AddActiveToComplainants < ActiveRecord::Migration[6.1]
  def change
    add_column :complainants, :active, :boolean, default: true
  end
end
