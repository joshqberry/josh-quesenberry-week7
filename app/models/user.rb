class User < ActiveRecord::Base

  has_secure_password

  validates :user_name, presence: true
  validates :user_name, uniqueness: true

  has_and_belongs_to_many :courses

end
