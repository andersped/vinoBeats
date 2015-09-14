class SessionsController < ApplicationController
  before_action :prevent_login_signup, only: [:signup, :create, :login, :attempt_login]
  
  def index
  end

  def login
  end
  
  def signup
  	@user = User.new
  end

  def create
  	@user = User.create user_params

  	# If the user is saved to the database then the sessions id == user_id and then goes to the root path
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to user_wines_path(current_user)
  	# If it doesn't save then it renders the signup page again
  	else
  		render :signup
  	end
  end

  def attempt_login
  	if params[:email].present? && params[:password].present?
  		found_user = User.where(email: params[:username]).first
  		if found_user && found_user.authenticate(params[:password])
  			session[:user_id] = found_user.id
  			redirect_to root_path
  		else
  			flash[:alert] = "username or password is invalid"
  			redirect_to login_path(@user)
  		end
  	else
  		flash[:alert] = "Please enter username and password"
  		redirect_to login_path
  	end
  end

  def logout
  	session[:user_id] = nil
  	flash[:notice] = "Logged out"
  	redirect_to login_path
  end

  private
	
		def user_params
			params.require(:user).permit(
				:name,
				:email,
				:password)
		end

end
