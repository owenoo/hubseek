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
		#binding.pry
		#if response != nil
		#	flash[:responseData] = JSON.parse(response.to_json)			
		#end
	end

	def basic_search
		
		response = RestClient.get 'https://api.github.com/search/repositories?q=game&page=1&per_page=100' 
		#, {:params => {:q => tetris, 'language' => 'assembly', :sort => 'star', :order => 'desc'}}

		flash[:responseData] = JSON.parse(response)
		binding.pry

		redirect_to url_for(:controller => 'github', :action => 'home'), :notice => "Search complete." 
	end

	def debug_getdata

		response = RestClient.get 'https://api.github.com/search/repositories?q=game&page=1&per_page=100' 
		#, {:params => {:q => tetris, 'language' => 'assembly', :sort => 'star', :order => 'desc'}}

		JSON.parse(response)

	end
end
