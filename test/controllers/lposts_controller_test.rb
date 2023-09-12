require "test_helper"

class LpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lpost = lposts(:one)
  end

  test "should get index" do
    get lposts_url
    assert_response :success
  end

  test "should get new" do
    get new_lpost_url
    assert_response :success
  end

  test "should create lpost" do
    assert_difference("Lpost.count") do
      post lposts_url, params: { lpost: { content: @lpost.content, luser_id: @lpost.luser_id, title: @lpost.title } }
    end

    assert_redirected_to lpost_url(Lpost.last)
  end

  test "should show lpost" do
    get lpost_url(@lpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_lpost_url(@lpost)
    assert_response :success
  end

  test "should update lpost" do
    patch lpost_url(@lpost), params: { lpost: { content: @lpost.content, luser_id: @lpost.luser_id, title: @lpost.title } }
    assert_redirected_to lpost_url(@lpost)
  end

  test "should destroy lpost" do
    assert_difference("Lpost.count", -1) do
      delete lpost_url(@lpost)
    end

    assert_redirected_to lposts_url
  end
end
