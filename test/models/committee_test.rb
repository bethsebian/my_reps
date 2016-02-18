require 'test_helper'

class CommitteeTest < ActiveSupport::TestCase
  attr_reader :committee

  def data
    {
    chamber: "senate",
    committee_id: "SSAP",
    name: "Senate Committee on Appropriations",
    subcommittee: false
    }
  end

  def setup
    @committee = Committee.new(data)
  end

  test "it sets committee id" do
    expected = "SSAP"
    assert_equal expected, @committee.committee_id
  end

  test "it sets committee name" do
    expected = "Senate Committee on Appropriations"
    assert_equal expected, @committee.committee_name
  end

  test "it sets hearing" do
    assert_equal 20, @committee.hearings.count
    assert_equal Hearing, @committee.hearings.first.class
  end
end
