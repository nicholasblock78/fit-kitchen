class RecipesController < ApplicationController
	def index

	end

	def new

	end
	
	def show
		@recipe = Recipe.find(params[:id])
		@user = User.find(@recipe.user_id)
	end
end
