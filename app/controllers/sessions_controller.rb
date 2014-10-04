class SessionsController < ApplicationController	
	
	def create     
		auth = request.env["omniauth.auth"]     
		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
		session[:user_id] = user.id     		

		if user && !(user.name.empty?)
			session[:display_name] = user.name
		elsif user && !(user.username.empty?)
			session[:display_name] = user.username
		else
			session[:display_name] = '[Error: Name or username was empty]'
		end

		flash[:authInfo] = auth.to_json	

		#redirect_to "github/home", :notice => "Signed in!"
		redirect_to url_for(:controller => 'github', :action => 'home'), :notice => "Signed in!"
	end
 
	def destroy
		session[:user_id] = nil
		session[:display_name] = nil
		redirect_to root_url, :notice => "Signed out!"
	end

	def sessionhello
		"I'm still using session controller scope!!"
	end
end
