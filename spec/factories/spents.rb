FactoryGirl.define do
  factory :spent do
    association :expense_type, factory: :expense_type
  end
end
