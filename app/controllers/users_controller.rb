class UsersController < ApplicationController

	before_action :authorize, only: [:show, :edit, :update, :destroy]
	before_action :adminize, only: [:index]
	#before_action(:only => [:show]) {authorize(params[:id])}

	def index
		@users = User.all
	end

	# Render show template. If ID is given checks if currently 
	# logged in user is an admin. If ID is not given shows currently logged in users profle.
	def show
		find_user_by_id params[:id]
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user].permit :username, :email, :password, :password_confirmation)
		@user.admin = false
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		find_user_by_id params[:id]
	end

	def update
		find_user_by_id params[:id]

		if @user.update_attributes(params[:user].permit :username, :email, :password, :password_confirmation)
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def destroy
		find_user_by_id params[:id]
		@user.destroy
		redirect_to users_path
	end
end
