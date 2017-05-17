class OtherIngredient < ApplicationRecord
  has_many :ingredients, as: :ingredient_kind, dependent: :destroy
  has_many :coctails, through: :ingredients, source: :ingredient_kind, source_type: 'OtherIngredient'
end
