FactoryBot.define do
  factory :customer_import do
    status { "pending" }
    file { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/customer_import.txt", "txt") }
  end
end
