require 'faker'

FactoryGirl.define do
	factory :achievement do
		name {Faker::Name.first_name}
		experience_points {Faker::Number.between(1, 100)}
		description {Faker::Name.name}
	end
end
