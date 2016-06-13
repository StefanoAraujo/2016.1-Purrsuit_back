require 'spec_helper'
require 'faker'

describe Party do
	it "is invalid without a name" do
		party_example = build(:party, name: nil)
		expect(party_example).to have(2).errors_on(:name)
		expect(party_example).to_not be_valid
	end

	it "is invalid with a repeated name" do
		same_name = "PARTIDO DOS RSPEC"
		party_example = create(:party, name: same_name)
		new_party_example = build(:party, name: same_name)
		expect(new_party_example).to have(1).errors_on(:name)
		expect(new_party_example).to_not be_valid
	end

  it "is invalid without an initials" do
    party_example = build(:party, initials: nil)
    expect(party_example).to have(2).errors_on(:initials)
    expect(party_example).to_not be_valid
  end

  it "is invalid with a repeated initials" do
    initials = 'PT'
    party_example = create(:party, initials: initials)
    new_party_example = build(:party, initials: initials)
    expect(new_party_example).to have(1).errors_on(:initials)
    expect(new_party_example).to_not be_valid
  end

end
