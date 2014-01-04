require 'spec_helper'

feature 'user creates a building spec' do
  scenario 'user submits valid information' do
    owner = FactoryGirl.create(:owner)
    visit root_path
    click_link 'Create New Building'
    fill_in 'Address', with: '200 Moon St.'
    fill_in 'City', with: 'Crater'
    select 'Wisconsin', from: 'State'
    fill_in 'Postal Code', with: '27106'
    fill_in 'Description', with: 'Brick'
    select "#{owner.first_name} #{owner.last_name}", from: 'Owner'
    click_on 'Create Building'

    expect(page).to have_content 'Create New Building'
    expect(page).to have_content 'Building created successfully'
  end

  scenario 'user submits invalid information' do
    visit root_path
    click_link 'Create New Building'
    click_on 'Create Building'

    expect_presence_error_for('building', :address)
    expect_presence_error_for('building', :city)
    expect_presence_error_for('building', :state)
    expect_presence_error_for('building', :postal_code)
  end
end
