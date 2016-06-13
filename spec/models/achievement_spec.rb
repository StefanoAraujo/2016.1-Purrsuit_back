require 'spec_helper'
require 'faker'

describe Quest do
	it "is invalid without a name" do
		achievement_example = build(:achievement, name: nil)
		expect(achievement_example).to have(1).errors_on(:name)
		expect(achievement_example).to_not be_valid
	end
	it "is invalid with a long name" do
		long_name = "b"*60;
		achievement_example = build(:achievement, name: long_name)
		expect(achievement_example).to have(1).errors_on(:name)
		expect(achievement_example).to_not be_valid
	end
	it "is invalid with a repeated name" do
		same_name = Faker::Name.first_name
		old_achievement_example = create(:achievement, name: same_name)
		new_achievement_example = build(:achievement, name: same_name)
		expect(new_achievement_example).to have(1).errors_on(:name)
		expect(new_achievement_example).to_not be_valid
	end
	it "is invalid without a description" do
		achievement_example = build(:achievement, description: nil)
		expect(achievement_example).to have(1).errors_on(:description)
		expect(achievement_example).to_not be_valid
	end
	it "is invalid with a long description" do
		long_description = "b"*141;
		achievement_example = build(:achievement, description: long_description)
		expect(achievement_example).to have(1).errors_on(:description)
		expect(achievement_example).to_not be_valid
	end
	it "is invalid with a repeated description" do
		same_description = Faker::Name.name
		old_achievement_example = create(:achievement, description: same_description)
		new_achievement_example = build(:achievement, description: same_description)
		expect(new_achievement_example).to have(1).errors_on(:description)
		expect(new_achievement_example).to_not be_valid
	end
	it "is invalid without an experience points value" do
		achievement_example = build(:achievement, experience_points: nil)
		expect(achievement_example).to have(2).errors_on(:experience_points)
		expect(achievement_example).to_not be_valid
	end
	it "is invalid without a numerically experience points" do
		experience_points = "example"
		achievement_example = build(:achievement, experience_points: experience_points)
		expect(achievement_example).to have(1).errors_on(:experience_points)
		expect(achievement_example).to_not be_valid
	end
end
