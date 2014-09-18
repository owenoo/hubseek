class GithubController < ApplicationController

	def search 

		x = GithubClient.new
		x.get_repo_list

	end

end
