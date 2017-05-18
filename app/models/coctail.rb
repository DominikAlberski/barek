class Coctail < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :simple_alcohols, through: :ingredients, source: :ingredient_kind, source_type: 'SimpleAlcohol', dependent: :destroy
  has_many :other_ingredients, through: :ingredients, source: :ingredient_kind, source_type: 'OtherIngredient', dependent: :destroy
  belongs_to :user
end
