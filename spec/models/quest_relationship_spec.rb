require 'rails_helper'

require 'spec_helper'
require 'faker'
require 'deputy.rb'



describe QuestRelationship do

  it "Has valid factory" do
    expect(build(:quest)).to be_valid
  end

end
