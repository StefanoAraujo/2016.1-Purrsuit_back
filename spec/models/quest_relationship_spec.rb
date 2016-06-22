require 'spec_helper'

describe QuestRelationship do
  it "Has a valid factory" do
    expect(build(:quest)).to be_valid
  end

  it "Should require a challenger_id" do
    challenger_id = build(:quest_relationship, challenger_id: nil)
    expect(challenger_id).to_not be_valid
  end

  it "Should require a challenged_id" do
    challenged_id = build(:quest_relationship, challenged_id: nil)
    expect(challenged_id).to_not be_valid
  end

end
