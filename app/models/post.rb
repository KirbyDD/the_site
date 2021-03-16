class Post < ApplicationRecord
  has_many :replies
  belongs_to :board
  belongs_to :user

end
