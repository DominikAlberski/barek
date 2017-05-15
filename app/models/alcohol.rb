class Alcohol < ApplicationRecord
  belongs_to :user
  has_one :other, dependent: :destroy
  has_one :whiskey, dependent: :destroy
  has_one :vodka, dependent: :destroy
  has_one :wine, dependent: :destroy
  has_one :liqueur, dependent: :destroy
  validates :kind, presence: true, inclusion: { in: %w(vodka whiskey wine liqueur oher) }
end
