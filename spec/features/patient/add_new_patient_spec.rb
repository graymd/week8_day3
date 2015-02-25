require 'rails_helper'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

describe 'test the add a new patient', type: :feature, js: true do

  FactoryGirl.create(:clinic)
  
  it 'should not allow submit until First and Last Name are entered' do
    visit clinics_path
    expect(page).to have_content('New Clinic Hospital')
    click_link 'New Clinic Hospital'
    expect(page).to have_content('Patients:')
    click_link 'Add Patient'
    expect(page).to have_content('Enter Patient Information')
    fill_in "First name", with: "Kitter"
    fill_in "Description", with: "" #need to click off Last name to enable button
    expect(page).to have_button('Submit', disabled: true)
    fill_in "Last name", with: "Cat"
    fill_in "Description", with: "" #need to click off Last name to enable button
    expect(page).to have_button('Submit', disabled: false)
    fill_in "First name", with: ""
    fill_in "Description", with: "" #need to click off Last name to enable button
    expect(page).to have_button('Submit', disabled: true)
  end


  it 'should show First name required until data entered into field' do
    visit clinics_path
    expect(page).to have_content('New Clinic Hospital')
    click_link 'New Clinic Hospital'
    expect(page).to have_content('Patients:')
    click_link 'Add Patient'
    expect(page).to have_content('Enter Patient Information')
    expect(page).to have_content('First name required')
    fill_in "First name", with: "Kitter"
    expect(page).not_to have_content('First name required')
    fill_in "First name", with: ""
    # expect(page).to have_content('First name required')
  end

   it 'should show Last name required until data entered into field' do
    visit clinics_path
    expect(page).to have_content('New Clinic Hospital')
    click_link 'New Clinic Hospital'
    expect(page).to have_content('Patients:')
    click_link 'Add Patient'
    expect(page).to have_content('Enter Patient Information')
    expect(page).to have_content('Last name required')
    fill_in "Last name", with: "Kitter"
    expect(page).not_to have_content('Last name required')
    fill_in "Last name", with: ""
    # expect(page).to have_content('Last name required')
  end







end