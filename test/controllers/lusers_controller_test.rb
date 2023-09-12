require "test_helper"

class PsusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lusers_index_url
    assert_response :success
  end

  test "should get show" do
    get lusers_show_url
    assert_response :success
  end

  test "should get new" do
    get lusers_new_url
    assert_response :success
  end

  test "should get edit" do
    get lusers_edit_url
    assert_response :success
  end
end
