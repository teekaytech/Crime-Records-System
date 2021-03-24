require "test_helper"

class CrimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crime = crimes(:one)
  end

  test "should get index" do
    get crimes_url
    assert_response :success
  end

  test "should get new" do
    get new_crime_url
    assert_response :success
  end

  test "should create crime" do
    assert_difference('Crime.count') do
      post crimes_url, params: { crime: { accused: @crime.accused, accuser: @crime.accuser, category_id: @crime.category_id, date: @crime.date, statements: @crime.statements, unknown_others: @crime.unknown_others, user_id: @crime.user_id } }
    end

    assert_redirected_to crime_url(Crime.last)
  end

  test "should show crime" do
    get crime_url(@crime)
    assert_response :success
  end

  test "should get edit" do
    get edit_crime_url(@crime)
    assert_response :success
  end

  test "should update crime" do
    patch crime_url(@crime), params: { crime: { accused: @crime.accused, accuser: @crime.accuser, category_id: @crime.category_id, date: @crime.date, statements: @crime.statements, unknown_others: @crime.unknown_others, user_id: @crime.user_id } }
    assert_redirected_to crime_url(@crime)
  end

  test "should destroy crime" do
    assert_difference('Crime.count', -1) do
      delete crime_url(@crime)
    end

    assert_redirected_to crimes_url
  end
end
