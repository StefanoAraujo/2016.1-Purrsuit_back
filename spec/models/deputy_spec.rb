require 'spec_helper'
require 'faker'

  describe Deputy do

    it "has a valid factory" do
      expect(build(:deputy)).to be_valid
    end

    it "is invalid without an email" do
      deputy_example = build(:deputy, email: nil)
      expect(deputy_example).to have(1).errors_on(:email)
      expect(deputy_example).to_not be_valid
    end

    it "is invalid without a registration" do
      deputy_example = build(:deputy, registration: nil)
      expect(deputy_example).to have(2).errors_on(:registration)
      expect(deputy_example).to_not be_valid
    end

    it "is invalid only with a unique registration" do
      registration = Faker::Number.between(3000, 4000)
      deputy_example1 = create(:deputy, registration: registration)
      deputy_example2 = build(:deputy, registration: registration)
      expect(deputy_example2).to have(1).errors_on(:registration)
      expect(deputy_example2).to_not be_valid
    end

  it "is invalid without a name" do
    deputy_example = build(:deputy, name: nil)
    expect(deputy_example).to have(1).errors_on(:name)
    expect(deputy_example).to_not be_valid
  end

  it "is invalid with a long name" do
   deputy_example = build(:deputy, name: "dhsjdhsjdheuyshdjsdkshsjdbhsgsjdhsgskdgsjdfgsjdhsjds")
   expect(deputy_example).to have(1).errors_on(:name)
   expect(deputy_example).to_not be_valid
  end

  it "is invalid without a deputy name" do
  deputy_example = build(:deputy, deputy_name: nil)
  expect(deputy_example).to have(1).errors_on(:deputy_name)
  expect(deputy_example).to_not be_valid
  end

  it "is invalid without a legislation situation" do
  legislation_example = build(:deputy, legislation_situation: nil)
  expect(legislation_example).to have(1).errors_on(:legislation_situation)
  expect(legislation_example).to_not be_valid
  end

  it "is invalid with a long legislation situation" do
  legislation_example = build(:deputy, legislation_situation: "dhsjdhsjdheuyshdjsdkshsjdbhsgsjdhsgskdgsjdfgsjdhsjdsdhsjdhsjdheuyshdjsdkshsjdbhsgsjdhsgskdgsjdfgsjdhsjds")
  expect(legislation_example).to have(1).errors_on(:legislation_situation)
  expect(legislation_example).to_not be_valid
  end

  it "is invalid with a long legislation situation" do
  legislation_example = build(:deputy, legislation_situation: "dhsjdhsjdheuyshdjsdkshsjdbhsgsjdhsgskdgsjdfgsjdhsjdsdhsjdhsjdheuyshdjsdkshsjdbhsgsjdhsgskdgsjdfgsjdhsjds")
  expect(legislation_example).to have(1).errors_on(:legislation_situation)
  expect(legislation_example).to_not be_valid
  end
  
  end
