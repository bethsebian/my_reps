class GovDataService
	attr_reader :connection

	def initialize
		@connection = Faraday.new(url: "https://congress.api.sunlightfoundation.com")
	end

	def representatives(latitude, longitude)
		raw = parse(connection.get("/legislators/locate?latitude=#{latitude}&longitude=#{longitude}&apikey=#{ENV['SUNLIGHT_API_KEY']}"))
		array_of_objects = raw[:results].map { |rep| Representative.new(rep) }
	end

	private

	def parse(response)
		JSON.parse(response.body, symbolize_names: true)
	end

end