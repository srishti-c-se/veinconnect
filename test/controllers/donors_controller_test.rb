require "test_helper"

class DonorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get donors_index_url
    assert_response :success
  end

  test "should get show" do
    get donors_show_url
    assert_response :success
  end

  test "should get edit" do
    get donors_edit_url
    assert_response :success
  end

  test "should get new" do
    get donors_new_url
    assert_response :success
  end

  test "should get create" do
    get donors_create_url
    assert_response :success
  end

  test "should get update" do
    get donors_update_url
    assert_response :success
  end

  test "should get medical_new" do
    get donors_medical_new_url
    assert_response :success
  end

  test "should get medical_create" do
    get donors_medical_create_url
    assert_response :success
  end
end
