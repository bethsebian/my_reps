class Representative
	attr_reader :data

	def initialize(data)
		@data = data
	end

	def service
		GovDataService.new
	end

	def image_url
		"http://bioguide.congress.gov/bioguide/photo/#{@data[:bioguide_id][0]}/#{@data[:bioguide_id]}.jpg"
	end

	def birthday_and_age
	end

	def chamber_rank_state
	end

	def name
	end

	def state_and_district
	end

	def party
	end

	def twitter
	end

	def website
	end

	def phone
	end

	def term_time
	end

	def latitude
		(39.73696)
	end

	def longitude
		(-104.95776)
	end

	private

	def self.build_object(data)
		OpenStruct.new(data)
	end


end