require 'rails_helper'


describe 'Visitor visits root' do
  scenario "Visitor sees welcome message and form" do
    visit root_path
    expect(page).to have_content("Air-Quality-Alert.net")
    expect(page).to have_content("What is my air quality?")
    fill_in 'zipcode', with: "98006"
    find_button('Get Air Quality')

    expect(page).to_not have_content("Text me if the air quality is")
    expect(page).to_not have_content("The Air Quality in is")
    expect(page).to_not have_content("Get FREE Updates When The Air Quality In Your Area Reaches Dangerous Levels")
  end
end
