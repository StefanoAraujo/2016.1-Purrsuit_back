require 'spec_helper'
require 'faker'

describe Quest do
	it "is invalid without a name" do
		quest_example = build(:quest, name: nil)
		expect(quest_example).to have(1).errors_on(:name)
		expect(quest_example).to_not be_valid
	end
	it "is invalid with a long name" do
		long_name = "a"*60;
		quest_example = build(:quest, name: long_name)
		expect(quest_example).to have(1).errors_on(:name)
		expect(quest_example).to_not be_valid
	end
	it "is invalid with a repeated name" do
		same_name = Faker::Name.first_name
		old_quest_example = create(:quest, name: same_name)
		new_quest_example = build(:quest, name: same_name)
		expect(new_quest_example).to have(1).errors_on(:name)
		expect(new_quest_example).to_not be_valid
	end
	it "is invalid without a description" do
		quest_example = build(:quest, description: nil)
		expect(quest_example).to have(1).errors_on(:description)
		expect(quest_example).to_not be_valid
	end
	it "is invalid with a long description" do
		long_description = "a"*141;
		quest_example = build(:quest, description: long_description)
		expect(quest_example).to have(1).errors_on(:description)
		expect(quest_example).to_not be_valid
	end
	it "is invalid with a repeated description" do
		same_description = Faker::Name.name
		old_quest_example = create(:quest, description: same_description)
		new_quest_example = build(:quest, description: same_description)
		expect(new_quest_example).to have(1).errors_on(:description)
		expect(new_quest_example).to_not be_valid
	end
	it "is invalid without an experience points value" do
		quest_example = build(:quest, experience_points: nil)
		expect(quest_example).to have(2).errors_on(:experience_points)
		expect(quest_example).to_not be_valid
	end
	it "is invalid without a numerically experience points" do
		experience_points = "example"
		quest_example = build(:quest, experience_points: experience_points)
		expect(quest_example).to have(1).errors_on(:experience_points)
		expect(quest_example).to_not be_valid
	end
end
