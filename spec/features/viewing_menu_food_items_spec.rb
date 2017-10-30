require "rails_helper"

RSpec.feature "Users can view food items" do 
  let!(:user) { FactoryBot.create(:user) }
  # let!(:menu) { FactoryBot.create(:menu) }
  # let!(:food) { FactoryBot.create(:food) }

  before do
  	login_as(user)
  	breakfast = FactoryBot.create(:menu, name: "Breakfast")
  	photo = Rack::Test::UploadedFile.new('spec/fixtures/pancake.jpg', 'image/jpg')
  	FactoryBot.create(:food, menu: breakfast,
  	                         name: "pancakes",
  	                         price: "300",
  	                         image: photo)
  end

  scenario "for a specific menu type" do 
  	visit "/"

  	click_link "Menu"
  	click_link "Breakfast"

  	expect(page).to have_content "pancakes"
  end
end