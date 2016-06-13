require 'spec_helper'
require 'faker'

describe Uf do
	it "is invalid without a name" do
		uf_example = build(:uf, name: nil)
		expect(uf_example).to have(2).errors_on(:name)
		expect(uf_example).to_not be_valid
	end
	it "is invalid with a long name" do
		long_name = "a"*31;
		uf_example = build(:uf, name: long_name)
		expect(uf_example).to have(1).errors_on(:name)
		expect(uf_example).to_not be_valid
	end
	it "is invalid with a repeated name" do
		same_name = Faker::Name.first_name
		uf_example = create(:uf, name: same_name)
		new_uf_example = build(:uf, name: same_name)
		expect(new_uf_example).to have(1).errors_on(:name)
		expect(new_uf_example).to_not be_valid
	end

  it "is invalid without an initials" do
    uf_example = build(:uf, initials: nil)
    expect(uf_example).to have(2).errors_on(:initials)
    expect(uf_example).to_not be_valid
  end

  it "is invalid with a repeated initials" do
    initials = 'GO'
    uf_example = create(:uf, initials: initials)
    new_uf_example = build(:uf, initials: initials)
    expect(new_uf_example).to have(1).errors_on(:initials)
    expect(new_uf_example).to_not be_valid
  end

  it "is invalid with a long initials" do
    long_initials = "a"*3;
    uf_example = build(:uf, initials: long_initials)
    expect(uf_example).to have(1).errors_on(:initials)
    expect(uf_example).to_not be_valid
  end


end
