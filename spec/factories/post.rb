FactoryBot.define do

  factory :post do
    title    {"test"}
    image    { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end

end