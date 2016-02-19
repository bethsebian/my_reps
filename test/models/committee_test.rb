require 'test_helper'

class CommitteeTest < ActiveSupport::TestCase
  attr_reader :committee

  def data
    {
    chamber: "senate",
    committee_id: "SSEG",
    name: "Senate Committee on Energy and Natural Resources",
    subcommittee: false
    }
  end

  def setup
    @committee = Committee.new(data)
  end

  test "it sets committee id" do
    expected = data[:committee_id]
    assert_equal expected, @committee.committee_id
  end

  test "it sets committee name" do
    expected = data[:name]
    assert_equal expected, @committee.committee_name
  end

  test "it sets hearing" do
    assert_equal 3, @committee.hearings.count
    assert_equal Hearing, @committee.hearings.first.class
  end
end
