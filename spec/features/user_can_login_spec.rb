require "rails_helper"

RSpec.describe "User can login", type: :feature, vcr: true do
  
  before do
    stub_omniauth
    login_user
  end

  scenario "user logs in with Github" do
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Tommasina")
    expect(page).to have_content("Logout")
    expect(page).to_not have_button("Sign in with Github")
    expect(page.status_code).to eq(200)
  end
  
  scenario "user logs out" do
    click_link "Logout"
    expect(page).to_not have_content("Tommasina")
    expect(page).to_not have_content("Logout")
    expect(page).to have_button("Sign in with Github")
    expect(page.status_code).to eq(200)
  end
end