require 'faker'

FactoryGirl.define do
  factory :deputy do
    name {Faker::Name.name}
    deputy_name {Faker::Name.name}
    email {Faker::Internet.email}
    registration {Faker::Number.between(1000,2000)}
    legislation_situation "Titular"
    gender "MASCULINO"
    image_path "qualquer"
    uf_id 1
    party_id 1
    followers_count 2
  end
end
