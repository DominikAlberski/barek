class OtherIngredient < ApplicationRecord
  has_many :ingredients
  has_many :coctails, :through => :ingredients
end
