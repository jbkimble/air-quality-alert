require 'rails_helper'

describe 'As a signed up user' do
  scenario 'I can cancel my alerts one by one' do
    Fabricate(:airIndex, id: 6)
    Fabricate(:weatherPoint, zipcode: '11111')
    Fabricate(:weatherPoint, zipcode: '00000')
    alert1 = Fabricate(:alert, phone:'1231231234', zipcode: '00000')
    alert2 = Fabricate(:alert, phone:'1231231234', zipcode: '11111')
    alert3 = Fabricate(:alert, phone:'1111111111', zipcode: '22222')
    # create confirmation code object

    visit root_path
    click_on "cancel-button"
    expect(current_path).to eq(alert_index_path)
    expect(page).to have_content("Enter your phone number to cancel your alerts")
    fill_in "Phone Number", with: "1231231234"
    click_button('Find My Alerts')
    expect(page).to have_content('Alerts for 1231231234')
    expect(page).to have_content('Alert 1')
    expect(page).to have_content('Zipcode: 00000')
    expect(page).to have_content('Cancel Alert')
    expect(page).to have_content('Alert 2')
    expect(page).to have_content('Zipcode: 11111')
    expect(page).to_not have_content('Zipcode: 22222')
    click_button 'Cancel Alert'
    expect(page).to have_content("Please enter code sent to phone to confirm cancelation")
    # send user text and have them confirm entry
    fill_in "Confirmation Code", with: '7890'
    click_button "Cancel Alert!"
    expect(page).to have_content("Alert for 00000 Successfully canceled")
    expect(page).to have_content("Alert 1")
    expect(page).to have_content("Zipcode: 11111")
    expect(alert1.active).to eq(false)
    expect(alert2.active).to eq(true)
    expect(alert3.active).to eq(true)
  end
end
