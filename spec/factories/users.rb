require 'faker'

FactoryGirl.define do
  random_password = Faker::Internet.password(8)
  factory :user do
    nickname {Faker::Name.first_name}
    email{Faker::Internet.email}
    password random_password
    password_confirmation random_password
    experience_points 0
    role_admin false
  end
end
