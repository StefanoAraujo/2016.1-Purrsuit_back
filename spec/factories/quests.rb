require 'faker'

FactoryGirl.define do
  factory :quest do
    name {Faker::Name.first_name}
    experience_points {Faker::Number.between(1,100)}
    description {Faker::Name.name}
    user_id 1
  end
end
