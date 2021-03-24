class Complainant < ApplicationRecord
  belongs_to :user
  validates :firstname, :surname, :dob, :nationality, :address, :occupation, :gender, :phone, presence: true,
            length: { minimum: 3 }
end
