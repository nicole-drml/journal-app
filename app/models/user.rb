class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password
end
