require 'omniauth'
require 'omniauth-github'
require 'rest_client'
require 'multi_json'
require 'pry'

# you will be able to access github by the following url
# /auth/providername for example /auth/github 
# See: config/initializers/omniauth.rb
class GithubClient

	#use Rack::Session::Cookie

	#Authentication with GitHub Search
	#def auth_github
	#	binding.pry
	#	RestClient.get "https://api.github.com/auth/github"
		#RestClient.post 'https://api.github.com/user', :param1 => 'one', :nested => { :param2 => 'two' }
		#RestClient.post "http://example.com/resource", { 'x' => 1 }.to_json, :content_type => :json, :accept => :json

	#end

	# Get a list of repositories and information about their programming languages
	# expects :keywords to be an array of words
	def get_repo_list(keywords, language, order)
		query = keywords.map(&:inspect).join('+')
		query += language
		query = ''
		RestClient.get "https://api.github.com/search/repositories", {:params => {:q => :query, sort => 'stars', order => 'desc'}}
	end

end