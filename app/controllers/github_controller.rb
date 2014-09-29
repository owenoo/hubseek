class GithubController < ApplicationController

	def search_github 

		binding.pry
		x = GithubClient.new
		x.get_repo_list

	end

	def home

	end

end
