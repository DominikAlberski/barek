class Coctail < ApplicationRecord
  has_many :ingredients
  has_many :simple_alcohols, through: :ingredients, source: :ingredient_kind, source_type: 'SimpleAlcohol'
  has_many :other_ingredients, through: :ingredients, source: :ingredient_kind, source_type: 'OtherIngredient'
  belongs_to :user
end
