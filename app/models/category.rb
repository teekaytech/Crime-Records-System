class Category < ApplicationRecord
  belongs_to :user
  has_many :crime_categories
  has_many :crimes, through: :crime_categories
  validates :name, presence: true, length: { minimum: 5 }
end
