require "rails_helper"

RSpec.feature "Users can edit food items" do 
  let!(:user) { FactoryBot.create(:user) }
  let(:menu) { FactoryBot.create(:menu) }
  let(:food) { FactoryBot.create(:food, menu: menu) }

  before do 
  	login_as(user)
  end

  scenario "for a specific menu type" do 
  	visit menu_food_path(menu, food)
  	
  	click_link "Edit Food"
  	fill_in "Name", with: "Pancakes with syrup"
  	click_button "Update Food"

    expect(page).to have_content "Food has been updated."
  end
end
