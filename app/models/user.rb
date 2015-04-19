class User < ActiveRecord::Base

	has_many :posts
	has_many :comments

	validates :username, presence: true, uniqueness: true
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# validates :email, length: { maximum: 255 },
               #     format: { with: VALID_EMAIL_REGEX }
    #validates :password, length: { minimum: 4 }
	has_secure_password
end
