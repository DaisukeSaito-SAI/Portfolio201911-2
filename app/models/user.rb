class User < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
