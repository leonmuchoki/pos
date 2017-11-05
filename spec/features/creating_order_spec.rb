require "rails_helper"

RSpec.feature "Users can create orders" do 
  let!(:user) { FactoryBot.create(:user) }

  before do
  	login_as(user)

  	breakfast = FactoryBot.create(:menu, name: "Breakfast")
  	photo_pancake = Rack::Test::UploadedFile.new('spec/fixtures/pancake.jpg', 'image/jpg')
  	FactoryBot.create(:food, menu: breakfast,
  	                         name: "pancakes",
  	                         price: "300",
  	                         image: photo_pancake)
    photo_sausages = Rack::Test::UploadedFile.new('spec/fixtures/sausages.jpg', 'image/jpg')
    FactoryBot.create(:food, menu: breakfast,
                             name: "sausages",
                             price: "100",
                             image: photo_sausages)
    photo_tea = Rack::Test::UploadedFile.new('spec/fixtures/greentea.jpg', 'image/jpg')
    FactoryBot.create(:drink, menu: breakfast,
                             name: "Green tea",
                             price: "70",
                             image: photo_tea)
  end

  scenario "for a specific menu type" do 
  	visit "/"

  	# click_link "Menu"
  	# click_link "Breakfast"
   #  click_link "Create New Order"
   #  first(:link, "Add to Order").click
   #  click_button "SUBMIT"

  	#expect(page).to have_content "Order created successfully."
  end
end