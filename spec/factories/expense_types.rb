FactoryGirl.define do
  factory :expense_type do
    subquota {Faker::Number.between(1,12)}
    description {"THE DESCRIPTION"}
    provider {"THE PROVIDER"}
    provider_registration {"CNPJ OR CPF"}
    ticket_number {"SOME NUMBER"}
    issue_date {"SOME DATE"}
    doc_value {Faker::Number.between(0,999999)}
    doc_value {Faker::Number.between(0,999999)}
  end
end
