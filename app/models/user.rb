class User < ApplicationRecord

  has_secure_password
  has_many :recipes

  validates :email, uniqueness: true

end
