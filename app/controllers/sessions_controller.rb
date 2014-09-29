class SessionsController < ApplicationController	

	#Natasha the robot
	def create     
		auth = request.env["omniauth.auth"]     
		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
		session[:user_id] = user.id     
		
		if user && user.name
			@display_name = user.name
		elsif user && user.username
			@display_name = user.username
		else
			@display_name = '[Error: Name or username was empty]'
		end

		flash[:authInfo] = auth.to_json
		redirect_to root_url, :notice => "Signed in!"
	end
 
	def destroy
	session[:user_id] = nil
	redirect_to root_url, :notice => "Signed out!"
	end
end
