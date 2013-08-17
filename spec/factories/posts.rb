# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    brand { "NIKE"}
    title { "Jordans and shit"}
    body  {  Faker::Lorem.sentences(3) }
    sequence(:price) { |n| "$#{n*100}" }
    trait :with_image do 
      image { [create(:image)] }
    end
  end
end
