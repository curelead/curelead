# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :size do
    name { Faker::Number.number(1) }
  end
end
