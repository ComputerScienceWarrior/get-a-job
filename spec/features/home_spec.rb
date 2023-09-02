require 'rails_helper'

RSpec.feature "Home Page", type: :feature do
  describe "home page" do
    it 'displays home page content' do
      visit root_path
      expect(page).to have_content("Welcome to our Home Page!")
    end
  end
end
