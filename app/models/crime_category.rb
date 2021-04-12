class CrimeCategory < ApplicationRecord
  belongs_to :crime
  belongs_to :category
end
