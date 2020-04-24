require 'test_helper'

class NewsfeedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get newsfeeds_index_url
    assert_response :success
  end

  test "should get show" do
    get newsfeeds_show_url
    assert_response :success
  end

  test "should get edit" do
    get newsfeeds_edit_url
    assert_response :success
  end

  test "should get new" do
    get newsfeeds_new_url
    assert_response :success
  end

end
