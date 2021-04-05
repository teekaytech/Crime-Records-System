class AddStatusToFirstInformationReport < ActiveRecord::Migration[6.1]
  def change
    add_column :first_information_reports, :status, :integer, default: 0
  end
end
