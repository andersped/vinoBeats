class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def confirm_logged_in
  	unless session[:user_id]
  		redirect_to login_path, alert: "Please log in"
  	end
  end

  def confirm_admin
  	unless current_user.is_admin
  		redirect_to root_path, alert: "You must be an admin"
  	end
  end

  def prevent_login_signup	
  	if session[:user_id]
  		redirect_to root_path, notice: "You are already logged in!"
  	end
  end

  def current_user
  	# this keeps from making a database query
  	return unless session[:user_id]
  	# this will define @current_user if it's not already defined
  	@current_user ||= User.find_by_id(session[:user_id])
  end
  
  helper_method :current_user

end
