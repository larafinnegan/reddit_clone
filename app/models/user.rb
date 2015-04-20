class User < ActiveRecord::Base
      attr_accessor :remember_token

	has_many :posts
	has_many :comments

	validates :username, presence: true, uniqueness: true
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# validates :email, length: { maximum: 255 },
               #     format: { with: VALID_EMAIL_REGEX }
    #validates :password, length: { minimum: 4 }
	has_secure_password

      def User.digest(string)
          BCrypt::Password.create(string)
      end

      def User.new_token
        SecureRandom.urlsafe_base64
      end

      def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
      end

      def authenticated?(remember_token)
        return false if remember_digest.nil?
        Bcrypt::Password.new(remember_digest).is_password?(remember_token)
      end

      def forget
        self.update_attribute(:remember_digest, nil)
      end

end
