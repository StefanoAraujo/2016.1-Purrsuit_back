require 'spec_helper'

describe Relationship do
  it "Has a valid factory" do
    expect(build(:relationship)).to be_valid
  end

  it "Should require a follower_id" do
    relationship = build(:relationship, follower_id: nil)
    expect(relationship).to have(1).errors_on(:follower_id)
    expect(relationship).to_not be_valid
  end

  it "Should require a followed_id" do
    relationship = build(:relationship, followed_id:nil)
    expect(relationship).to have(1).errors_on(:followed_id)
    expect(relationship).to_not be_valid
  end
end
