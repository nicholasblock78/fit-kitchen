require 'unirest'

class PagesController < ApplicationController
	def index
		p params
		@recipes = Recipe.all
		# These code snippets use an open-source library.
	end

	def search
		p params[:search]
		response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?limitLicense=false&number=10&offset=0&query=" + params[:search], 
			headers:{
				"X-Mashape-Key" => "nMARLGZymnmshppAMcfnST0uONvdp1lfM7XjsntqbAgkLWke3n", 
				"Accept" => "application/json"
			}	
		
		@returned = response.body

		render json: response
	end

	def ingredients
		# These code snippets use an open-source library.
		response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:recipe_id]}/information?includeNutrition=true",
		  headers:{
		    "X-Mashape-Key" => "df5zfjHNYVmsh1rLDDYkH5pS7T4Cp1nIxb0jsnSvLpl1KIi11H",
		    "Accept" => "application/json"
		  }

		render json: response
	end

	def instructions
		response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:recipe_id]}/analyzedInstructions?stepBreakdown=true",
		  headers:{
		    "X-Mashape-Key" => "df5zfjHNYVmsh1rLDDYkH5pS7T4Cp1nIxb0jsnSvLpl1KIi11H",
		    "Accept" => "application/json"
		  }
		  

	  render json: response
	end
end


# These code snippets use an open-source library.
