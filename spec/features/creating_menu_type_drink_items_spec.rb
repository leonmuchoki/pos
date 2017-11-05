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
  	click_link "Add Drink"
  	fill_in "Name", with: "Green Tea"
  	fill_in "Price", with: 1.02
  	attach_file("Drink Image", Rails.root + "spec/fixtures/greentea.jpg")
  	click_button "Create"

  	expect(page).to have_content "Drink item has been created."
  end
end