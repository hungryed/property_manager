require 'spec_helper'

feature 'user creates a building spec' do
  scenario 'user submits valid information' do
    visit root_path
    click_link 'Create New Building'
    fill_in ''
  end

  scenario 'user submits invalid information'
end
