require 'rails_helper'

RSpec.feature "About Us Page", type: :feature do
  describe "about us page" do
    it 'displays about us page content' do
      visit '/about'
      expect(page).to have_content("All About Us!")
    end
  end
end
