class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :sub

  validates :title, :content, :user, :sub, presence: true
end
