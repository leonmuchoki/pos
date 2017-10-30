require "rails_helper"

RSpec.feature "Users can add food items" do 
  let!(:user) { FactoryBot.create(:user) }
  let!(:menu) { FactoryBot.create(:menu) }

  before do 
  	login_as(user)
  end

  scenario "for a specific menu type" do 
  	visit "/"
  	click_link "Menu"
  	#select menu.name, :from => "menu-type"
  	#find('#menu-type').find(:xpath, menu.name).select_option
  	click_link menu.name
  	click_link "Add Food"
  	fill_in "Name", with: "Pancakes"
  	fill_in "Price", with: 1.40
  	attach_file("Food Image", Rails.root + "spec/fixtures/pancake.jpg")
  	click_button "Create"

  	expect(page).to have_content "Food item has been created."
  end
end