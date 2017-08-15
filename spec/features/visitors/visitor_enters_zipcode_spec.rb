require 'rails_helper'

describe 'as a visitor', js: true do
  scenario 'When I enter a valid zipcode I see data about that zipcode' do
    VCR.use_cassette 'airvisual_feature' do
      visit root_path
      fill_in 'zipcode', with: "98372"
      find_button('Get Air Quality').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Unhealthy")
      expect(page).to have_content("Puyallup")
    end
  end

  scenario 'When I enter a zipcode that air visual has no data for back up api returns info' do
    VCR.use_cassette 'airnow_feature' do
      visit root_path
      fill_in 'zipcode', with: "98006"
      find_button('Get Air Quality').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Good")
      expect(page).to have_content("Seattle-Bellevue-Kent Valley, USA")
    end
  end

  scenario 'When I enter a non valid zipcode I get descriptive error messages' do
    visit root_path
    fill_in 'zipcode', with: 'a'

    expect(page).to have_content("Please enter a valid 6 digit zipcode")
  end

  scenario 'When I try to enter more than six numbers I get a descriptive error message' do
    visit root_path
    fill_in 'zipcode', with: '980006'

    expect(page).to have_content("Please enter a valid 6 digit zipcode")
  end

end
