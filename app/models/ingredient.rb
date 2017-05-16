class Ingredient < ApplicationRecord
  belongs_to :coctail
  belongs_to :ingredient_kind, polymorphic: true 
end
