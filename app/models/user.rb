class User < ActiveRecord::Base

  has_secure_password

  validates :user_name, presence: true
  validates :user_name, uniqueness: true
end
