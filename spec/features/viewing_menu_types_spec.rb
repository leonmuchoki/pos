require "rails_helper"

RSpec.feature "Users can view menu types" do 
  let!(:user) { FactoryBot.create(:user) }
  let!(:menu) { FactoryBot.create(:menu) }

  before do 
  	login_as(user)
  end

  scenario "with valid credentials" do 
  	visit "/"

  	click_link "Menu"
  	
    #expect(page).to have_select('menu_type', selected: 'Breakfast')
    expect(page).to have_select 'menu-type', with_options: [menu.name]
  end
end