require 'rails_helper'

RSpec.feature 'UserLogin', type: :feature do
  let(:user) { create(:user) }

  scenario 'user signs in successfully' do
    # Visit the login page
    visit new_user_session_path

    # Fill in the login form
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    # Submit the login form
    click_button 'Log in'

    # Verify successful login
    expect(page).to have_current_path(authenticated_root_path)
    expect(page).to have_content('Products')
    expect(page).to have_content('Sign Out')
  end
end
