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
    select owner.name, from: 'Owner'
    click_on 'Create Building'

    expect(page).to have_content 'Create New Building'
    expect(page).to have_content 'Building created successfully'
  end

  scenario 'user submits invalid information'
end
