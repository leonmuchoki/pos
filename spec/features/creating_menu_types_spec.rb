require "rails_helper"

RSpec.feature "Users can create new menu items" do 
  let!(:user) { FactoryBot.create(:user) }

  before do 
  	login_as(user)

  	visit "/"
  	click_link "Menu"
  end
  
  scenario "can create new menu type" do 
  	click_link "New Menu type"
  	fill_in "Name", with: "breakfast"
  	click_button "Create"

  	expect(page).to have_content "Menu type added successfully."
  end

  scenario "should not provide invalid attributes" do 
  	click_link "New Menu type"
  	click_button "Create"

  	expect(page).to have_content "Menu type has not been created."
  	expect(page).to have_content "Name can't be blank"
  end

  scenario "can create new food item" do 
  	# click_link "New Food"
  	# # select "food", from: menu_type
  	# fill_in "Food Name", with: "biriyani"
  	# fill_in "Food Price", with: 3.50
  	# click_button "Create"

  	# expect(page).to have_content "Menu item created successfully."
  end

  scenario "can create new drink item" do 
  	# click_link "New Drink"
  	# select "drink", from: menu_type
  	##fill_in "Drink Name", with: "soda"
  	##fill_in "Drink Price", with: 0.50
  	##click_button "Create"

  	##expect(page).to have_content "Menu item created successfully."
  end
end