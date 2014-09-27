class User < ActiveRecord::Base		

	def init
	end

	def self.find_or_create_for_github(response)
		data = response['extra']['user_hash']
		if user = User.find_by_github_id(data["id"])         # Find user
			user
		else                                         
			# Create a user with
			# a stub password.
			user = User.new(:email => "github+#{data["id"]}@example.com",
			:password => Devise.friendly_token[0,20])
			user.github_id = data["id"]
			user.github_screen_name = data["screen_name"]
			user.github_display_name = data["display_name"]
			user.confirm!
			user
		end
	end

	def self.create_with_omniauth(auth)
	    create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
	    end
  	end
end
