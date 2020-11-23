FactoryBot.define do
  factory :club do
    sequence(:name){|n| "name#{n}"}
    profile {"profile"}
  end
end