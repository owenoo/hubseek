require 'json'
require 'rest-client'
require 'rest_client'

class GithubController < ApplicationController

	def search_github 
		binding.pry
		x = GithubClient.new
		x.get_repo_list

	end

	def home
		binding.pry
		if response != nil
			flash[:responseData] = JSON.parse(response.to_json)			
		end
	end

	def basic_search
		binding.pry
		response = RestClient.get '/search/repositories', {:params => {:q => tetris, 'language' => 'assembly', :sort => 'star', :order => 'desc'}}

		flash[:response_str] = response.to_str
		binding.pry
	end
end
