FactoryBot.define do
  factory :customer do
    email { "john.doe@test.com" }
    first_name { "John" }
    last_name { "Doe" }
  end
end
