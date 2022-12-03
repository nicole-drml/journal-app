class User < ApplicationRecord
  validates :name, :email, :password_digest, presence: true
  has_secure_password
end
