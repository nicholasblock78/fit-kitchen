class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	# helper_method :current_user 

	# before_action :require_user, only: [:index, :show]
	
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def require_user
		if current_user
			true
		else
			redirect_to sessions_new_path, notice: "You must be logged in to view that page."
		end
	end
end
