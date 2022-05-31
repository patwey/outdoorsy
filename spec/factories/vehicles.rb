FactoryBot.define do
  factory :vehicle do
    name { "Big Wheel" }
    type { "bicycle" }
    length { 5 }
    customer
  end
end
