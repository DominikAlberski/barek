class Ingredient < ApplicationRecord
  belongs_to :coctail
  belongs_to :other_ingredient
  belongs_to :alcohol
end
