require 'test_helper'

class ModeldetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get admins" do
    get modeldetails_admins_url
    assert_response :success
  end

  test "should get users" do
    get modeldetails_users_url
    assert_response :success
  end

  test "should get organisations" do
    get modeldetails_organisations_url
    assert_response :success
  end

  test "should get projects" do
    get modeldetails_projects_url
    assert_response :success
  end

  test "should get tasks" do
    get modeldetails_tasks_url
    assert_response :success
  end

end
