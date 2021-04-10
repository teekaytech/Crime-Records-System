require 'application_system_test_case'

class ComplainantsTest < ApplicationSystemTestCase
  setup do
    @complainant = complainants(:one)
  end

  test 'visiting the index' do
    visit complainants_url
    assert_selector 'h1', text: 'Complainants'
  end

  test 'creating a Complainant' do
    visit complainants_url
    click_on 'New Complainant'

    fill_in 'Address', with: @complainant.address
    check 'Criminal' if @complainant.criminal
    fill_in 'Dob', with: @complainant.dob
    fill_in 'Firstname', with: @complainant.firstname
    fill_in 'Gender', with: @complainant.gender
    fill_in 'Nationality', with: @complainant.nationality
    fill_in 'Occupation', with: @complainant.occupation
    fill_in 'Phone', with: @complainant.phone
    fill_in 'Surname', with: @complainant.surname
    fill_in 'User', with: @complainant.user_id
    click_on 'Create Complainant'

    assert_text 'Complainant was successfully created'
    click_on 'Back'
  end

  test 'updating a Complainant' do
    visit complainants_url
    click_on 'Edit', match: :first

    fill_in 'Address', with: @complainant.address
    check 'Criminal' if @complainant.criminal
    fill_in 'Dob', with: @complainant.dob
    fill_in 'Firstname', with: @complainant.firstname
    fill_in 'Gender', with: @complainant.gender
    fill_in 'Nationality', with: @complainant.nationality
    fill_in 'Occupation', with: @complainant.occupation
    fill_in 'Phone', with: @complainant.phone
    fill_in 'Surname', with: @complainant.surname
    fill_in 'User', with: @complainant.user_id
    click_on 'Update Complainant'

    assert_text 'Complainant was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Complainant' do
    visit complainants_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Complainant was successfully destroyed'
  end
end
