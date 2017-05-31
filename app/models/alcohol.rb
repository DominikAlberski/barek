class Alcohol < ApplicationRecord
  belongs_to :user
  has_one :other, dependent: :destroy, inverse_of: :alcohol
  has_one :whiskey, dependent: :destroy, inverse_of: :alcohol
  has_one :vodka, dependent: :destroy, inverse_of: :alcohol
  has_one :wine, dependent: :destroy, inverse_of: :alcohol
  has_one :liqueur, dependent: :destroy, inverse_of: :alcohol
  accepts_nested_attributes_for :other, reject_if: proc { |attributes| attributes['kind'].blank? }
  accepts_nested_attributes_for :whiskey, reject_if: proc { |attributes| attributes['kind'].blank? }
  accepts_nested_attributes_for :vodka, reject_if: proc { |attributes| attributes['kind'].blank? }
  accepts_nested_attributes_for :wine, reject_if: proc { |attributes| attributes['kind'].blank? }
  accepts_nested_attributes_for :liqueur, reject_if: proc { |attributes| attributes['kind'].blank? }
  attr_accessor :photo
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "alcohol_default.jpg"
  validates :kind, presence: true, inclusion: { in: %w(vodka whiskey wine liqueur oher) }

end
