require 'test_helper'

class RepresentativeTest < ActiveSupport::TestCase
	attr_reader :rep

	def data
		{:bioguide_id=>"G000562",
		 :birthday=>"1974-08-22",
		 :chamber=>"senate",
		 :contact_form=>nil,
		 :crp_id=>"N00030780",
		 :district=>nil,
		 :facebook_id=>"160924893954206",
		 :fax=>nil,
		 :fec_ids=>["H0CO04122", "S4CO00395"],
		 :first_name=>"Cory",
		 :gender=>"M",
		 :govtrack_id=>"412406",
		 :icpsr_id=>21112,
		 :in_office=>true,
		 :last_name=>"Gardner",
		 :lis_id=>"S377",
		 :middle_name=>nil,
		 :name_suffix=>nil,
		 :nickname=>nil,
		 :oc_email=>"Sen.Gardner@opencongress.org",
		 :ocd_id=>"ocd-division/country:us/state:co",
		 :office=>"354 Russell Senate Office Building",
		 :party=>"R",
		 :phone=>"202-224-5941",
		 :senate_class=>2,
		 :state=>"CO",
		 :state_name=>"Colorado",
		 :state_rank=>"junior",
		 :term_end=>"2021-01-03",
		 :term_start=>"2015-01-06",
		 :thomas_id=>"01998",
		 :title=>"Sen",
		 :twitter_id=>"SenCoryGardner",
		 :votesmart_id=>30004,
		 :website=>"http://www.gardner.senate.gov",
		 :youtube_id=>nil
	 	}
	end

	def setup
		@rep = Representative.new(data)
	end

  test "it sets an image url" do
		url = "http://bioguide.congress.gov/bioguide/photo/G/G000562.jpg"
		assert_equal url, @rep.image_url
  end

	test "it sets a birthday and age" do
		expected = "August 22, 1974 (age 41)"
		assert_equal expected, @rep.birthday_and_age
  end

	test "it sets a chamber, rank, and state" do
		expected = "U.S. Senate, Junior, Colorado (at-large)"
		assert_equal expected, @rep.chamber_rank_state
  end

	test "it sets a name" do
		expected = "Senator Cory Gardner"
		assert_equal expected, @rep.name
  end

	test "it sets a party" do
		expected = "R"
		assert_equal expected, @rep.party
  end

	test "it sets a twitter handle" do
		expected = "SenCoryGardner"
		assert_equal expected, @rep.twitter
  end

	test "it sets a website" do
		expected = "http://www.gardner.senate.gov"
		assert_equal expected, @rep.website
  end

	test "it sets a phone" do
		expected = "202-224-5941"
		assert_equal expected, @rep.website
  end

	test "it sets a term window" do
		expected = "January 6, 2015 - January 3, 2021"
		assert_equal expected, @rep.website
	end
end