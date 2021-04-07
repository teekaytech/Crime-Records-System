class AddActiveToFirstInformationReports < ActiveRecord::Migration[6.1]
  def change
    add_column :first_information_reports, :active, :boolean, default: true
  end
end
