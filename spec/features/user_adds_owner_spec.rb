require 'spec_helper'

feature 'user adds an owner' do
  scenario 'user submits valid information' do
    visit root_path
    click_link 'Add Owner'
    fill_in 'First Name', with: 'Jim'
    fill_in 'Last Name', with: 'Waffle'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Company', with: 'Motorola'
    click_on 'Create Owner'

    expect(page).to have_content 'Owner created successfully'
    expect(page).to have_content 'Add Owner'
  end

  context "user submits invalid information" do

    scenario 'user submits blank information' do
      visit new_owner_path
      click_on 'Create Owner'

      expect_presence_error_for('owner', :first_name)
      expect_presence_error_for('owner', :last_name)
      expect_presence_error_for('owner', :email)
    end

    scenario 'user submits bad email' do
      visit new_owner_path
      fill_in 'Email', with: 'user@user'
      click_on 'Create Owner'

      within('.input.owner_email') do
        expect(page).to have_content 'does not appear to be valid'
      end
    end
  end
end
