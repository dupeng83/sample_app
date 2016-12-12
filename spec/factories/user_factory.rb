FactoryGirl.define do
  factory :user do
    # sequence(:email) { |n| "test#{n}@example.com" }
    name "xiaoming"
    email "xiaoming@example.com"
    password "password"
  end
end
