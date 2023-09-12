require "test_helper"

class LpostulationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lpostulation = lpostulations(:first_lpost)
  end

  test "should get lpostulation" do
    assert_difference "Lpostulation.count", 1 do
      pspost psposts_path, params:
      { apply: {
        kind: "Aplicar"
      }}
      end
      assert_redirect_to pspost_path(Post.last)
      assert_response :found
      assert_equal 302, response.status
      assert_equal "text/html", response.media_type
      assert_equal "utf-8", response.charset
  end
end
