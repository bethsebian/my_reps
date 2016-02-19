require 'test_helper'

class HearingTest < ActiveSupport::TestCase
	attr_reader :hearing

	def data
		{
		  "committee_id": "HSIF",
		  "occurs_at": "2013-01-22T15:00:00Z",
		  "congress": 113,
		  "chamber": "house",
		  "dc": true,
		  "room": "2123 Rayburn HOB",
		  "description": "Hearings to examine the state of the right to vote after the 2012 election.",
		  "bill_ids": ["s2423-114", "s1910-114"],
		  "url": "http://energycommerce.house.gov/markup/committee-organizational-meeting-113th-congress",
		  "hearing_type": "Hearing"
		}
	end

	def setup
		@hearing = Hearing.new(data)
	end

  test "it sets type" do
		expected = "Hearing"
		assert_equal expected, hearing.type
  end

	test "it sets date" do
		expected = "January 22, 2013"
		assert_equal expected, hearing.date
  end

	test "it sets time" do
		expected = "3:00 PM"
		assert_equal expected, hearing.time
  end

	test "it sets committee_name" do
		expected = nil
		assert_equal expected, hearing.committee_name
	end

	test "it sets room" do
		expected = "2123 Rayburn HOB"
		assert_equal expected, hearing.room
  end

	test "it sets bills" do
		expected = ["<a href='http://beta.congress.gov/bill/114th/senate-bill/2423'>A bill making appropriations to address the heroin and opioid drug abuse epidemic for the fiscal year ending September 30, 2016, and for other purposes.</a>",
								"<a href='http://beta.congress.gov/bill/114th/senate-bill/1910'>Financial Services and General Government Appropriations Act, 2016</a>"
							 ]
		assert_equal expected, hearing.bills
  end

	test "it sets description" do
		expected = "Hearings to examine the state of the right to vote after the 2012 election."
		assert_equal expected, hearing.description
  end

	test "it sets url" do
		expected = "<a href='http://energycommerce.house.gov/markup/committee-organizational-meeting-113th-congress'>more info...</a>"
		assert_equal expected, hearing.url
  end
end