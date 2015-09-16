class MusicsController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
	before_action :set_user, only: [:index, :create]


  def index
  	@music = Music.new
  	@genre = Music.new
  end

  def create
  	@genre = URI.encode(params[:genre][:url])
  	@varietal = URI.encode(params[:varietal][:url])

  	music_service = WineFinder.new(@varietal, @winery)
		@htmlResponse = music_service.music_search

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
