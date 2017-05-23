FactoryGirl.define do
  factory :user do
    sequence(:email)    { |n| "person#{n}@example.com" }
    sequence(:password) { |n| "person#{n}@example.com" }
    sequence(:username) { |n| "UserNo.#{n}" }
  end
end
