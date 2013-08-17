# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name(6) }
    email { Faker::Internet.email }
    password 'password'

    trait :with_post do
      posts { [create(:post)] }
    end

    trait :with_post_with_image do 
      posts { [create(:post, :with_image)]}
    end
  end
end
