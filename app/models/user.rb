class User < ApplicationRecord
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username
  has_many :reminders

  has_secure_password
end
