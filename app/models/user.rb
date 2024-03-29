class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :image_url, presence: true

  has_many :favorites
  has_many :items, through: :favorites
end
