class Hearing
	attr_reader :data

	def initialize(data)
		@data = data
	end

	def service
		GovDataService.new
	end

	def type
		@data[:hearing_type].capitalize
	end

	def date
		date_object = Date.parse(@data[:occurs_at])
		date_string = "#{date_object.strftime('%B%e, %Y')}"
	end

	def time
		date_object = Date.parse(@data[:occurs_at])
		time_string = "#{date_object.strftime('%l:M% %p')}"
	end

	def committee_name
		service.committee_name(@data[:committee_id])
	end

	def room
		@data[:room]
	end

	def bills
		"FIXXXXX"
		# @data[:bill_ids]
	end

	def description
		@data[:description]
	end

	def url
		@data[:url]
		"<a href='#{@data[:url]}'>'more info...'</a>"
	end
end