FactoryBot.define do 
  factory :user do 
      username {"taro"}
      sequence(:email) {|n| "email{n}@example.com"}
      password {"password"}
  end 
end 