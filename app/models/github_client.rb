require 'omniauth'
require 'rest-client'

class GithubClient

	use Rack::Session::Cookie
	use OmniAuth::Strategies::Developer

	use OmniAuth::Builder do
	  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
	end	

	#Authentication with GitHub Search
	def auth_github
		
		#RestClient.post 'https://api.github.com/user', :param1 => 'one', :nested => { :param2 => 'two' }
		#RestClient.post "http://example.com/resource", { 'x' => 1 }.to_json, :content_type => :json, :accept => :json

	end



end