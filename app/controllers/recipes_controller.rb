class RecipesController < ApplicationController
	def show
		@recipe = Recipe.find(params[:id])
		@user = User.find(@recipe.user_id)
	end
end
