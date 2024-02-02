class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :image_url, presence: true
end
