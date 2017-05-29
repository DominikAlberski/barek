class Coctail < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :simple_alcohols, through: :ingredients, source: :ingredient_kind, source_type: 'SimpleAlcohol', dependent: :destroy
  has_many :other_ingredients, through: :ingredients, source: :ingredient_kind, source_type: 'OtherIngredient', dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100" }, default_url: "default.png"
  belongs_to :user

  scope :with_simple_alcohol_kind, ->(kind) {joins(:simple_alcohols).where("simple_alcohols.kind = ?", kind)}
end
