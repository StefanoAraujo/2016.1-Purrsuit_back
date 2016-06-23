require 'rails_helper'
require 'faker'
describe Spent  do

  before :each do
    @spent = create(:spent_with_expenses)

    @array = [Faker::Number.between(1,12),Faker::Number.between(1,12)]

    def subquota(array)
      subquota_value = 0
      @spent.expense_types.each do |expense|
        if expense.subquota.in?(array)
          subquota_value =   subquota_value  + expense.doc_value
        end
      end
      return subquota_value
    end

  end

  it "Should return correct total cost value" do
    total_value = 0
    @spent.expense_types.each do |expense|
      total_value = total_value + expense.doc_value
    end
    expect(@spent.total_cost_value?).to eq(total_value)
  end

  it "Should return correct total value of a specific subquota" do
    total_value = subquota(@array)
    expect(@spent.subquota_total(@array)).to eq(total_value)
  end

  it "Should return correct total value of office cost " do
    total_value = subquota(['1','12'])
    expect(@spent.total_office_cost?).to eq(total_value)
  end

  it "Should return correct total value of contract cost " do
    total_value = subquota(['4'])
    expect(@spent.total_contract_cost?).to eq(total_value)
  end

  it "Should return correct total value of gas cost " do
    total_value = subquota(['3'])
    expect(@spent.total_gas_cost?).to eq(total_value)
  end

  it "Should return correct total value of advertising cost " do
    total_value = subquota(['5'])
    expect(@spent.total_advertising_cost?).to eq(total_value)
  end

  it "Should return correct total value of security cost " do
    total_value = subquota(['8'])
    expect(@spent.total_security_cost?).to eq(total_value)
  end

  it "Should return correct total value of phone cost " do
    total_value = subquota(['10'])
    expect(@spent.total_phone_cost?).to eq(total_value)
  end

  it "Should return correct total value of postal cost " do
    total_value = subquota(['11'])
    expect(@spent.total_postal_cost?).to eq(total_value)
  end

  it "Should return correct total value of alimentation cost " do
    total_value = subquota(['13'])
    expect(@spent.total_alimentation_cost?).to eq(total_value)
  end

  it "Should return correct total value of accommodation cost " do
    total_value = subquota(['14'])
    expect(@spent.total_accommodation_cost?).to eq(total_value)
  end

  it "Should return correct total value of vehicle tenancy cost " do
    total_value = subquota(['119','120','121','122','123'])
    expect(@spent.total_vehicle_tenancy?).to eq(total_value)
  end

  it "Should return correct total value of participation cost " do
    total_value = subquota(['137'])
    expect(@spent.total_participation_cost?).to eq(total_value)
  end

  it "Should return correct total value of air ticket cost " do
    total_value = subquota(['9','999'])
    expect(@spent.total_air_ticket?).to eq(total_value)
  end


end
