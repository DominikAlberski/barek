FactoryGirl.define do
  factory :alcohol do
    name 'Sample Alcohol Name'
    brand 'Sample Alcohol Brand'
    kind 'vodka'
    country 'Poland'
    alk 40
    price 40
    association :user, factory: :user
  end
end
