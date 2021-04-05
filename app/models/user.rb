class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :firstname, :lastname, :gender, :phone, :address, :avatar, presence: true, length: { minimum: 3 }
  has_many :crimes, class_name: 'Crime', dependent: :destroy
  has_many :categories, class_name: 'Category', dependent: :destroy
  has_many :complainants, class_name: 'Complainant', dependent: :destroy
  has_many :first_information_reports, class_name: 'FirstInformationReport', dependent: :destroy

  def username
    self.email.split('@')[0].capitalize
  end
end
