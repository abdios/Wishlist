class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "You need to be logged in before doing that!" if current_user.nil?
  end

  def adminize
  	if !current_user.nil?
  		redirect_to root_url, alert: "Y U NO ADMIN!?!?!?" if !current_user.admin
  	else
  		authorize
  	end 
  end

  # Find user recod by id if currently logged in user is admin. Otherwise just finds current user record.
  def find_user_by_id(userid)
    if userid && current_user.admin
      @user = User.find(userid)
    else
      @user = current_user
    end
  end
end
