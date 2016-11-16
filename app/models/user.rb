require 'bcrypt'
class User < ApplicationRecord

	validates :email, uniqueness: true

	def password
		@password ||= BCrypt::Password.new(password_hash)
	end

	def password=(new_password)
		@raw_password = new_password
		@password = BCrypt::Password.create(new_password)
		self.password_digest = @password
	end

	def self.authenticate(email, pass)
	  	user_login = User.find_by(email: email) #returns user
	  	if user_login && user_login.password == pass
	  		return user_login
	  	end
		  	nil
		end
end
