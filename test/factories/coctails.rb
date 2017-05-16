FactoryGirl.define do
  factory :coctail do
    name 'sample_coctail'
    description 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores veritatis natus atque? Consequuntur autem ea magni fugiat, dicta natus id excepturi quam minus, asperiores quis, vitae maiores ullam quod aliquam.'
    association :user, factory: :user  
  end
end