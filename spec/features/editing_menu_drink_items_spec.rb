require "rails_helper"

RSpec.feature "Users can edit drink items" do 
  let!(:user) { FactoryBot.create(:user) }
  let(:menu) { FactoryBot.create(:menu) }
  let(:drink) { FactoryBot.create(:drink, menu: menu) }

  before do 
  	login_as(user)
  end

  scenario "for a specific menu type" do 
  	visit menu_drink_path(menu, drink)
  	
  	click_link "Edit Drink"
  	fill_in "Name", with: "Grean tea herbal"
  	click_button "Update Drink"

    expect(page).to have_content "Drink has been updated."
  end
end