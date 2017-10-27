require "rails_helper"

RSpec.feature "Signed in users can log out" do 
  let!(:user) { FactoryBot.create(:user) }

  before do 
  	login_as(user)
  end

  scenario do 
  	visit "/"
  	click_link "Sign out"
  	expect(page).not_to have_content user.email
  end
end