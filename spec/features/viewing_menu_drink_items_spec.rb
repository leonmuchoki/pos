require "rails_helper"

RSpec.feature "Users can view drink items" do 
  let!(:user) { FactoryBot.create(:user) }

  before do
  	login_as(user)

  	breakfast = FactoryBot.create(:menu, name: "Breakfast")
  	photo = Rack::Test::UploadedFile.new('spec/fixtures/greentea.jpg', 'image/jpg')
  	FactoryBot.create(:drink, menu: breakfast,
  	                         name: "Green tea",
  	                         price: "300",
  	                         image: photo)
  end

  scenario "for a specific menu type" do 
  	visit "/"

  	click_link "Menu"
  	click_link "Breakfast"

  	expect(page).to have_content "Green tea"
  end
end