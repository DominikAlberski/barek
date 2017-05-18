class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :alcohols, dependent: :destroy
  has_many :coctails
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
