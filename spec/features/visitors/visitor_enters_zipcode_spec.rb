require 'rails helper'

describe 'as a visitor' do
  scenarion 'When I enter a valid zipcode I see data about that zipcode' do
    visit root_path
    fill_in 'zipcode', with: "98006"
    find_button('Get Air Quality').click

    expect(current_path).to eq(air_quality_path)
    expect(page).to have_content("140")
    expect(page).to have_content("Unhealthy for Sensative Groups")
    expect(page).to have_content("Seattle")
  end
end
