class Cocktail < ApplicationRecord
  has_many :ingredients
  has_many :alcohols, through: :ingredients
  has_many :other_ingredient, through: :ingredients
  belongs_to :user
end
