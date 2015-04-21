class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :sub
  has_many :comments

  default_scope -> { order(created_at: :desc) }

  validates :title, :content, :user, :sub, presence: true
end
