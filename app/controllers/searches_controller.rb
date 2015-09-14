class SearchesController < ApplicationController
	before_action :set_wine, only: [:show, :edit, :update, :destroy]
	before_action :set_user, only: [:index, :create]

	def index
		@search = Search.new
		# @vineyard = name["Vineyard"]
	end

	def create
    @wine = Wine.new

		# require 'open-uri'

		@varietal = URI.encode(params[:varietal][:url])
		@winery = URI.encode(params[:winery][:url])

		wine_service = WineFinder.new(@varietal, @winery)
		@htmlResponse = wine_service.wine_search


		# url = "http://services.wine.com/api/beta2/service.svc/json/catalog?search=#{varietal}&size=50&apikey=a16ee38c0befcddba3b69ff693aa5ece"
		
		# htmlRequest = Typhoeus::Request.new(
			# url,
			# :headers => {"User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36"})
			# @htmlResponse = JSON.parse htmlRequest.run.response_body
			
			render :index
		

	end

	def show
	end

	# @request = Typhoeus.get("https://itunes.apple.com/search?term=spears")
  		# @response1 = JSON.parse @request.response_body
  	# 	firstresult = @response1
  	# 	binding.pry

	private

		def set_user
  		@user = current_user
		end

		def search_params
			params.require(:search).permit
		end

		def set_wine
			@wine = Wine.find_by_id params[:id]
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


end
