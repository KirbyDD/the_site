class User < ApplicationRecord
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username
  has_many :reminders
  has_one :profile
  has_one :security_question

  enum role: %w(default admin)

  has_secure_password
end
