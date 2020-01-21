class User < ApplicationRecord
  has_many :games
  validates :username, presence: true, uniqueness: true
  has_secure_password #hashes password in DB
end
