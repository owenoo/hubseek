class User < ActiveRecord::Base		

	def self.find_or_create_for_github(response)
		data = response['extra']['user_hash']
		if user = User.find_by_twitter_id(data["id"])         # Find user
			user
		else                                         
			# Create a user with
			# a stub password.
			user = User.new(:email =&gt; "twitter+#{data["id"]}@example.com",
			:password =&gt; Devise.friendly_token[0,20])
			user.twitter_id = data["id"]
			user.twitter_screen_name = data["screen_name"]
			user.twitter_display_name = data["display_name"]
			user.confirm!
			user
		end
	end
end
