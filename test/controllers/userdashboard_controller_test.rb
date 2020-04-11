require 'test_helper'

class UserdashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get projectsdash" do
    get userdashboard_projectsdash_url
    assert_response :success
  end

  test "should get tasksdash" do
    get userdashboard_tasksdash_url
    assert_response :success
  end

end
