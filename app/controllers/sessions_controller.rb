class SessionsController < ApplicationController
	def new

	end


  def create
  	@errors = []
    @user = User.authenticate(params['email'], params['password'])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors.push('Email or password is incorrect')
      render 'new'
    end
  end

	# def create
	# 	@user = User.find_by_email(params[:session][:email])
	# 	p @user
	# 	if @user && @user.password == params[:session][:password]
	# 		session[:user_id] = @user.id
	#   		redirect_to @user
	#   	else
	#   		@errors = @user.errors
	# 		render 'new'
	# 	end
	# end

	def destroy 
		session[:user_id] = nil 
		redirect_to '/' 
	end
end
