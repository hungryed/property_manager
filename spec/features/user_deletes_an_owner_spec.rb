require 'spec_helper'

feature 'user view an owner' do
  let!(:owner) { FactoryGirl.create(:owner) }
  scenario "can see an owner's information" do
    visit root_path
    click_link 'See Owner List'
    expect(page).to have_content(owner.first_name)
    expect(page).to have_content(owner.last_name)
    click_link owner.display_string

    expect(page).to have_content(owner.first_name)
    expect(page).to have_content(owner.last_name)
    expect(page).to have_content(owner.email)
  end

  scenario 'can delete owner from home page' do
    visit owner_path(owner)
    click_on 'Remove Owner'

    expect(page).to have_content('Owner removed successfully')
    expect(page).to_not have_content(owner.first_name)
    expect(page).to_not have_content(owner.last_name)
    expect(page).to_not have_content(owner.email)
  end
end
