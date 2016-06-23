FactoryGirl.define do
  factory :spent do
    deputy_id 1

    factory :spent_with_expenses do
      transient do
        expense_types_count 10
      end
      after(:create) do |spent, evaluator|
       create_list(:expense_type, evaluator.expense_types_count, spent: spent)
     end
    end
  end
end
