FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:password) { |n| "person#{n}@example.com" }
  end
end
