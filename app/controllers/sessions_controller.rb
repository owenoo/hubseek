class SessionsController < ApplicationController

	#controller callbacks
	before_filter :authenticate_user, :only => [:home, :profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]

	#methods
	def login

	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end

	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user			
			session[:user_id] = authorized_user.id
			flash[:notice] = "Hello again, #{authorized_user.username}"
			redirect_to(:action => 'home')
		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color]= "invalid"
			render "login"	
		end
	end

	def home
	end

	def profile
	end

	def setting
	end

	# Omniauth
	def create_github_session
	    @user = User.find_or_create_for_github(env["omniauth.auth"])
		flash[:notice] = "Signed in with GitHub successfully."
		sign_in_and_redirect @user, :event => :authentication
	end

	def begin_oauth_process
		redirect_to('/auth/github')
	end

	def create
	end

	def failure
	end
end
