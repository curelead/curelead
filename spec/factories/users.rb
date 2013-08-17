# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name(6)
    email Faker::Internet.email
    password 'Password'
  end
end
