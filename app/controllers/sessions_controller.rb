class SessionsController < ApplicationController
	def new

	end

	def create
		#user = User.find_by_email(params[:email.lowercase])
		user = User.find(:first, :conditions => [ "lower(email) = ?", params[:email].downcase ])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, notice: "SYou have successfully logged in!"
		else
			flash.now.alert = "Invalid username and/or password!"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "You have logged out!"
	end
end
