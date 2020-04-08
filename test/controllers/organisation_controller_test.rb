require 'test_helper'

class OrganisationControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get organisation_edit_url
    assert_response :success
  end

  test "should get new" do
    get organisation_new_url
    assert_response :success
  end

  test "should get show" do
    get organisation_show_url
    assert_response :success
  end

end
