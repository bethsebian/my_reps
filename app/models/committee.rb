class Committee
	attr_reader :data

	def initialize(data)
		@data = data
	end

	def service
		GovDataService.new
	end

	def committee_id
		@data[:committee_id]
	end

	def committee_name
		@data[:name]
	end

	def hearings
		service.hearings(committee_id)
	end
end