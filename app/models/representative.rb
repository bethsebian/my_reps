class Representative
	attr_reader :data
	# attr_accessor :hearings

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
		birthdate = Date.parse(@data[:birthday])
		age = ((DateTime.now - birthdate) / 365.25).floor
		"#{birthdate.strftime('%B %e, %Y')} (age #{age})"
	end

	def chamber_rank_state
		position = "U.S. Senate, #{@data[:state_name]}" if @data[:chamber] == "senate"
		position = "U.S. House, District #{@data[:district]}" if @data[:chamber] == "house"
		position
	end

	def name
		"#{@data[:title]} #{@data[:first_name]} #{@data[:last_name]}"
	end

	def party
		@data[:party]
	end

	def twitter
		@data[:twitter_id]
	end

	def website
		@data[:website]
	end

	def phone
		@data[:phone]
	end

	def term_window
		term_start = Date.parse(@data[:term_start])
		term_end = Date.parse(@data[:term_end])
		"#{term_start.strftime('%B%e, %Y')} - #{term_end.strftime('%B%e, %Y')}"
	end

	def rep_id
		@data[:bioguide_id]
	end

	def latitude
		(39.73696)
	end

	def longitude
		(-104.95776)
	end

	def committees
		service.committees(rep_id)
	end

	def hearings
		@hearings_list = []
		committees.each { |committee| add_committees_hearings_to_list(committee) }
		sort_hearings(@hearings_list)
	end

	def add_committees_hearings_to_list(committee)
		ch = committee.hearings
		ch.each { |hearing| add_each_hearing_to_list(hearing, committee) } if !ch.empty?
	end

	def add_each_hearing_to_list(hearing, committee)
		hearing.data[:committee_name] = committee.committee_name
		@hearings_list << hearing
	end

	def sort_hearings(hearings)
		hearings.sort do |a,b|
			comp = (a.date <=> b.date)
			comp.zero? ? (a.time <=> b.time) : comp
		end
	end

	private

	def self.build_object(data)
		OpenStruct.new(data)
	end
end