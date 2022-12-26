class User < ApplicationRecord
  has_many :photos
  has_secure_password

  validates :login_id, presence: true, uniqueness: true
end
