class CreateFirstInformationReports < ActiveRecord::Migration[6.1]
  def change
    create_table :first_information_reports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :complainant, null: false, foreign_key: true
      t.string :offense
      t.datetime :date
      t.string :location
      t.string :suspect_details

      t.timestamps
    end
  end
end
