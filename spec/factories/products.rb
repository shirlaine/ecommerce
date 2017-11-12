FactoryBot.define do
  factory :product do
    name "Milk"
    description "Full fat milk from NZ."
    image "MyString"
    trait :invalid do
      name nil
    end
  end
end
