require 'json'

class GithubController < ApplicationController

	def search_github 

		binding.pry
		x = GithubClient.new
		x.get_repo_list

	end

	def home
		binding.pry
		if request != nil
			flash[:requestData] = JSON.parse(request.to_json)			
		end

	end

end
