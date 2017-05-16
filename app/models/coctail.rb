class Coctail < ApplicationRecord
  has_many :ingredients
  has_many :alcohols, through: :ingredients, source: :ingredient_kind, source_type: 'Alcohol'
  has_many :other_ingredients, through: :ingredients, source: :ingredient_kind, source_type: 'OtherIngredient'
  belongs_to :user
end
