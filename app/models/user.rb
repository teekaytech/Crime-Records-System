class User < ApplicationRecord
  has_secure_password

  mount_uploader :avatar, AvatarUploader

  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :firstname, :lastname, :gender, :phone, :address, presence: true
  has_many :crimes, class_name: 'Crime', dependent: :destroy
  has_many :categories, class_name: 'Category', dependent: :destroy
  has_many :complainants, class_name: 'Complainant', dependent: :destroy
  has_many :first_information_reports, class_name: 'FirstInformationReport', dependent: :destroy

  def username
    email.split('@')[0].capitalize
  end

  def full_name
    "#{firstname} #{lastname}"
  end

  def account_type
    admin ? 'Admin Officer' : 'Police Officer'
  end

  scope :all_active, -> { where(active: TRUE).all }
end
