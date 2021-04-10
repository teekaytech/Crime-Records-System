require 'test_helper'

class FirstInformationReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first_information_report = first_information_reports(:one)
  end

  test 'should get index' do
    get first_information_reports_url
    assert_response :success
  end

  test 'should get new' do
    get new_first_information_report_url
    assert_response :success
  end

  test 'should create first_information_report' do
    assert_difference('FirstInformationReport.count') do
      post first_information_reports_url,
           params: { first_information_report: { complainant_id: @first_information_report.complainant_id,
                                                 date: @first_information_report.date,
                                                 location: @first_information_report.location,
                                                 offense: @first_information_report.offense,
                                                 suspect_details: @first_information_report.suspect_details,
                                                 user_id: @first_information_report.user_id } }
    end

    assert_redirected_to first_information_report_url(FirstInformationReport.last)
  end

  test 'should show first_information_report' do
    get first_information_report_url(@first_information_report)
    assert_response :success
  end

  test 'should get edit' do
    get edit_first_information_report_url(@first_information_report)
    assert_response :success
  end

  test 'should update first_information_report' do
    patch first_information_report_url(@first_information_report),
          params: { first_information_report: { complainant_id: @first_information_report.complainant_id,
                                                date: @first_information_report.date,
                                                location: @first_information_report.location,
                                                offense: @first_information_report.offense,
                                                suspect_details: @first_information_report.suspect_details,
                                                user_id: @first_information_report.user_id } }
    assert_redirected_to first_information_report_url(@first_information_report)
  end

  test 'should destroy first_information_report' do
    assert_difference('FirstInformationReport.count', -1) do
      delete first_information_report_url(@first_information_report)
    end

    assert_redirected_to first_information_reports_url
  end
end
