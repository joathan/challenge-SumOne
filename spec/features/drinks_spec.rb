require 'rails_helper'

RSpec.feature "Drink", type: :feature do
  scenario 'access root page' do
    visit(root_path)
    expect(page).to have_content('The drinks searcher')
  end
end
