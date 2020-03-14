FactoryBot.define do

  factory :post do
    title    {"test"}
    image    { Rack::Test::UploadedFile.new(File.join(Rails.root, 'test/fixtures/files/test.jpg')) }
  end

end