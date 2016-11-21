require 'unirest'

class PagesController < ApplicationController
	def index
		@recipes = Recipe.all
		# These code snippets use an open-source library.
		response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?limitLicense=false&number=10&offset=0&query=burger", 
			headers:{
				"X-Mashape-Key" => "nMARLGZymnmshppAMcfnST0uONvdp1lfM7XjsntqbAgkLWke3n", 
				"Accept" => "application/json"
			}	
		
		@returned = response.body
	end
end
