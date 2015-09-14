require 'open-uri'

class WineFinder
  def initialize(varietal, winery)
  	@varietal = varietal
  	@winery = winery
  	
  end

  def wine_search

		url = "http://services.wine.com/api/beta2/service.svc/json/catalog?search=#{@varietal}+#{@winery}&size=50&apikey=a16ee38c0befcddba3b69ff693aa5ece"
		
		htmlRequest = Typhoeus::Request.new(
			url,
			:headers => {"User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36"})
			JSON.parse htmlRequest.run.response_body

	end
end