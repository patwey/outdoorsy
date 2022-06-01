FactoryBot.define do
  factory :vehicle do
    name { "Big Wheel" }
    kind { Vehicle::BICYCLE }
    length { 5 }
    customer
  end
end
