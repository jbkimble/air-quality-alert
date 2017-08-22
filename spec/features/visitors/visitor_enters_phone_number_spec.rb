require 'rails_helper'

describe 'as a visitor', js: true do
  scenario 'when I enter my phone number it validates that I only enter numbers' do
    VCR.use_cassette 'airnow' do
      visit root_path
      fill_in 'zipcode', with: "98006"
      find_button('Get Air Quality').click
      expect(current_path).to eq(root_path)

      fill_in "phone-input", with: "555t"
      expect(page).to have_content("Please enter a 10 digit phone number containing only numbers")
    end
  end

  scenario 'when I enter my phone number it prevents me from entering more than 10 digits' do
    VCR.use_cassette 'airnow' do
      visit root_path
      fill_in 'zipcode', with: "98006"
      find_button('Get Air Quality').click
      expect(current_path).to eq(root_path)

      fill_in "phone-input", with: "55555555555"
      expect(page).to have_content("Please enter a 10 digit phone number containing only numbers")
    end
  end

end
