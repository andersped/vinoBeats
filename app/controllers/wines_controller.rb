class WinesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  # This might have to be for all routes/check to see if other users can see other user's wines
  before_action :ensure_correct_user_for_wine, only: [:edit, :update, :destroy]

  def index
    @wines = @user.wines
    respond_to do |format|
      format.html
      format.json { render json: @wines }
    end
  end

  def new
  	@wine = Wine.new
  end

  def create
  	@wine = @user.wines.create wine_params

    if @wine.save
      redirect_to searches_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  	@wine.update wine_params

  	if @wine.save
  		redirect_to root_path(current_user), flash:{success: "#{@wine.name} Updated!"}
  	else
  		render :edit
  	end
  end

  def show
  end

  def destroy
  	@wine.destroy
  	redirect_to root_path(current_user), flash: {success: "#{@wine.name} was successfully deleted"}
  end


  private

  def set_wine
  	@wine = Wine.find_by_id params[:id]
  end

  def set_user
  	@user = current_user
  end

  def wine_params
  	params.require(:wine).permit(
  		:name,
      :varietal,
  		:vintage,
  		:winery,
  		:vineyard,
  		:image,
  		:rating,
  		:owner_id,
      :appellation,
      :label
  		)
  end

  def ensure_correct_user_for_wine
  	wine = Wine.find params[:id]
  	unless wine.user.id == session[:user_id]
  		redirect_to root_path, alert: "Not authorized"
  	end
  end

end
