FactoryBot.define do
  factory :customer_import do
    status { "pending" }
    file { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/pipes.txt", "txt") }
    metadata { { success: [], error: [] } }

    trait :comma_separated_file do
      file { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/commas.txt", "txt") }
    end

    trait :pipe_separated_file do
      file { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/pipes.txt", "txt") }
    end
  end
end
