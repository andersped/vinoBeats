require 'open-uri'

class MusicFinder

	def initialize(varietal)
		@varietal = varietal
	end

	def music_search

		url = "http://api.soundcloud.com/tracks.json?client_id="+ process.env.SOUNDCLOUD_SECRET +"&limit=50&q="+ req.query.genre;
		
		htmlRequest = Typhoeus::Request.new(
			url,
			:headers => {"User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36"})
			JSON.parse htmlRequest.run.response_body

	end
	end
	
end
