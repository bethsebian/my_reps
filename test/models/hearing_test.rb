require 'test_helper'

class HearingTest < ActiveSupport::TestCase
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
	end

  test "it " do
  end

end