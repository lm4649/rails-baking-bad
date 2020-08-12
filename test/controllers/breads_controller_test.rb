require 'test_helper'

class BreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get breads_show_url
    assert_response :success
  end

  test "should get new" do
    get breads_new_url
    assert_response :success
  end

  test "should get create" do
    get breads_create_url
    assert_response :success
  end

end
