class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || password_digest_changed? }
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
