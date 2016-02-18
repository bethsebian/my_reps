class Committee
	attr_reader :data

	def initialize(data)
		binding.pry
		@data
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

	def committee_parent_id
		@data[:parent_committee_id]
	end

	def subcommittee?
		@data[:subcommittee]
	end

	def hearings
		service.hearings(committee_id)
	end
end