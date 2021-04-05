class FirstInformationReport < ApplicationRecord
  belongs_to :user
  belongs_to :complainant
  validates :offense, :date, :location, :suspect_details, presence: true, length: { minimum: 5 }
  enum status: %i[pending approved rejected]
end
