class GovDataService
	attr_reader :connection

	def initialize
		@connection = Faraday.new(url: "https://congress.api.sunlightfoundation.com")
	end

	def representatives(latitude, longitude)
		raw = parse(connection.get("/legislators/locate?latitude=#{latitude}&longitude=#{longitude}&apikey=#{ENV['SUNLIGHT_API_KEY']}"))
		array_of_objects = raw[:results].map { |rep| Representative.new(rep) }
	end

	def committees(rep_id)
		raw = parse(connection.get("/committees?member_ids=#{rep_id}&apikey=#{ENV['SUNLIGHT_API_KEY']}"))
		array_of_objects = raw[:results].map { |committee| Committee.new(committee) }
	end

	def hearings(committee_id)
		raw = parse(connection.get("/hearings?committee_id=#{committee_id}&apikey=#{ENV['SUNLIGHT_API_KEY']}"))
		array_of_objects = raw[:results].map { |hearing| Hearing.new(hearing) }
	end

	def committee_name(committee_id)
		raw = parse(connection.get("/committees?committee_id=#{committee_id}&apikey=#{ENV['SUNLIGHT_API_KEY']}"))
		name = raw[:results][:name]
	end

	private

	def parse(response)
		JSON.parse(response.body, symbolize_names: true)
	end

end