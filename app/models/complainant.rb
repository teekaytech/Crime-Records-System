class Complainant < ApplicationRecord
  belongs_to :user
  has_many :first_information_reports
  validates :firstname, :surname, :dob, :nationality, :address, :occupation, :gender, :phone, presence: true,
                                                                                              length: { minimum: 3 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :all_active, -> { where(active: TRUE).all }
end
