FactoryGirl.define do
  factory :alcohol do
    name "Sample Alcohol Name"
    brand "Sample Alcohol Brand"
    kind "vodka"
    country "Poland"
    alk 40
    price 40.99
    photo 'sample img or url'
  end
end
