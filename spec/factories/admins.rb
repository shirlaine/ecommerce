FactoryBot.define do
  factory :admin do
    sequence(:firstname) { |n| "first#{n}" }
    sequence(:lastname) { |n| "last#{n}" }
    sequence(:username) { |n| "user#{n}" }
    sequence :email do |n|
    "person#{n}@example.com"
     end
    password "123123"
  end
end
