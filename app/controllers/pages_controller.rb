require 'unirest'

class PagesController < ApplicationController
	def index
		p params
		@recipes = Recipe.all
		# These code snippets use an open-source library.
	end

	def search
		p params
		response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?limitLicense=false&number=10&offset=0&query=" + params[:search], 
			headers:{
				"X-Mashape-Key" => "nMARLGZymnmshppAMcfnST0uONvdp1lfM7XjsntqbAgkLWke3n", 
				"Accept" => "application/json"
			}	
		
		@returned = response.body

		render json: response
	end
end
