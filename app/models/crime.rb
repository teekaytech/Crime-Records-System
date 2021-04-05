class Crime < ApplicationRecord
  belongs_to :user
  has_many :crime_categories
  has_many :categories, through: :crime_categories
  validates :accused, :accuser, :unknown_others, :date, :statements, presence: true, length: { minimum: 3 }
end
