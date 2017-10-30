FactoryBot.define do
  factory :food do
    name "biriyani"
    price "300"
    menu 1
    image { Rack::Test::UploadedFile.new('spec/fixtures/pancake.jpg', 'image/jpg') } 
  end
end
