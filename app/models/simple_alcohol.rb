class SimpleAlcohol < ApplicationRecord
  has_many :ingredients, as: :ingredient_kind
  has_many :coctails, through: :ingredients, source: :ingredient_kind, source_type: 'SimpleAlcohol'
  validates :kind, presence: true, inclusion: { in: %w(vodka whiskey wine liqueur rum tequila gin champagne brandy) }
end
