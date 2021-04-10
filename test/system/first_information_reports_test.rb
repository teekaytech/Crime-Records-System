require 'application_system_test_case'

class FirstInformationReportsTest < ApplicationSystemTestCase
  setup do
    @first_information_report = first_information_reports(:one)
  end

  test 'visiting the index' do
    visit first_information_reports_url
    assert_selector 'h1', text: 'First Information Reports'
  end

  test 'creating a First information report' do
    visit first_information_reports_url
    click_on 'New First Information Report'

    fill_in 'Complainant', with: @first_information_report.complainant_id
    fill_in 'Date', with: @first_information_report.date
    fill_in 'Location', with: @first_information_report.location
    fill_in 'Offense', with: @first_information_report.offense
    fill_in 'Suspect details', with: @first_information_report.suspect_details
    fill_in 'User', with: @first_information_report.user_id
    click_on 'Create First information report'

    assert_text 'First information report was successfully created'
    click_on 'Back'
  end

  test 'updating a First information report' do
    visit first_information_reports_url
    click_on 'Edit', match: :first

    fill_in 'Complainant', with: @first_information_report.complainant_id
    fill_in 'Date', with: @first_information_report.date
    fill_in 'Location', with: @first_information_report.location
    fill_in 'Offense', with: @first_information_report.offense
    fill_in 'Suspect details', with: @first_information_report.suspect_details
    fill_in 'User', with: @first_information_report.user_id
    click_on 'Update First information report'

    assert_text 'First information report was successfully updated'
    click_on 'Back'
  end

  test 'destroying a First information report' do
    visit first_information_reports_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'First information report was successfully destroyed'
  end
end
