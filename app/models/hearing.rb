class Hearing
	attr_reader :data

	def initialize(data)
		@data = data
	end

	def service
		GovDataService.new
	end

	def type
		@data[:hearing_type] || "Hearing"
	end

	def date
		date_object = Date.parse(@data[:occurs_at])
		date_string = "#{date_object.strftime('%B %e, %Y')}"
	end

	def time
		date_object = DateTime.parse(@data[:occurs_at])
		time_string = "#{date_object.strftime('%l:%M %p')}".strip
	end

	def committee_name
		service.committee_name(@data[:committee_id])
	end

	def room
		@data[:room]
	end

	def bills
		@data[:bill_ids].map do |bill_id|
			"<a href='#{service.bill_url(bill_id)}'>#{service.bill_name(bill_id)}</a>"
		end
	end

	def description
		@data[:description]
	end

	def url
		"<a href='#{@data[:url]}'>more info...</a>"
	end
end