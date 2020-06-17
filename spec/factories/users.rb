FactoryBot.define do
  factory :user do
    email  { Faker::Internet.email }
    username { Faker::Artist.name }
    password { Faker::Color.color_name }
  end
end
