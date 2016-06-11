require 'rails_helper'

describe Level do

  it "is factory valid" do
    factory = FactoryGirl.build(:level)
    if factory.respond_to?(:valid?)
    end
  end

  it "have a minimum level" do
    level_exemple = build(:level, xp_min: 1)
  end

end
