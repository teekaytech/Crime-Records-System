class Crime < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :accused, :accuser, :unknown_others, :date, :statements, presence: true, length: { minimum: 3 }
end
