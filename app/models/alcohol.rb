class Alcohol < ApplicationRecord
  belongs_to :user
  has_one :other, dependent: :destroy
  has_one :whiskey, dependent: :destroy
  has_one :vodka, dependent: :destroy
  has_one :wine, dependent: :destroy
  has_one :liqueur, dependent: :destroy
  attr_accessor :photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates :kind, presence: true, inclusion: { in: %w(vodka whiskey wine liqueur oher) }

end
