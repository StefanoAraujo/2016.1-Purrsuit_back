require 'spec_helper'
require 'faker'
require 'deputy.rb'



describe User do

  it "Has valid factory" do
    expect(build(:user)).to be_valid
  end

	it "is invalid without a nickname" do
		user = build(:user, nickname: nil)
		expect(user).to have(1).errors_on(:nickname)
		expect(user).to_not be_valid
	end

  it "Should follow and unfollow a deputy" do
    user = create(:user)
    deputy_example = create(:deputy)
    expect(user.following?(deputy_example)).to be false
    user.follow(deputy_example)
    user.following?(deputy_example)
    expect(user.following?(deputy_example)).to be true
    expect(deputy_example.followers.include?(user)).to be true
    user.unfollow(deputy_example)
    expect(user.following?(deputy_example)).to be  false
  end


end
