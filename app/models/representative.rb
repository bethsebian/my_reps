class Representative
	attr_reader :data

	def initialize(data)
		@data = data
	end

	def service
		GovDataService.new
	end

	def representatives
		build_object(service.representatives)
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