require 'json'
require 'rest-client'
require 'rest_client'

class GithubController < ApplicationController

	attr_accessor :search_result

	def search_github 
		binding.pry
		x = GithubClient.new
		x.get_repo_list

	end

	def home
		binding.pry
		if @search_result.blank?
			@search_result = [{"default" => "empty"}]
		end
		#binding.pry
		#if response != nil
		#	flash[:responseData] = JSON.parse(response.to_json)			
		#end
	end

	def basic_search
		
		#stars:10..20 size:<1000

		response = RestClient.get 'https://api.github.com/search/repositories?q=game&page=1&per_page=20' 
		#, {:params => {:q => tetris, 'language' => 'assembly', :sort => 'star', :order => 'desc'}}

		hash_response = JSON.parse(response)
		items = hash_response["items"]
		@search_result = map_items(items)
		#flash[:htmlGithubList] = display_all(list)

		flash[:responseData] = hash_response
		flash[:firstHit] = hash_response["items"][0]		
		flash[:search_result] = @search_result
		
		binding.pry
		redirect_to url_for(:controller => 'github', :action => 'home'), :notice => "Search complete." 
	end

	def map_items (items)

		# items = [ {},{}, ... , {} ]
		result = []
		
		items.each do |item_hash|
			elem = {}
			elem["id"] = item_hash["id"]
			elem["name"] = item_hash["name"]
			elem["language"] = item_hash["language"]
			elem["url"] = item_hash["url"]
			elem["score"] = item_hash["score"]
			result.push(elem)
		end
		binding.pry
		return result
	end

	def debug_getdata

		response = RestClient.get 'https://api.github.com/search/repositories?q=game&page=1&per_page=3' 
		#, {:params => {:q => tetris, 'language' => 'assembly', :sort => 'star', :order => 'desc'}}

		JSON.parse(response)

	end

	def helloworld
		"Hello World"
		binding.pry
	end

	def display_all(collection)
		content_tag(:ul, :class => "list") do
			collection.collect do |member|
				content_tag(:li, :id => member.name.gsub(' ', '-').downcase.strip) do
					member.name
				end
	    	end
	  	end
	end

	private
  	
  	def search_result_params
    	params.require(:search_results).permit!
  	end

	helper_method :display_all
end
