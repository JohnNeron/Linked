require "application_system_test_case"

class LpostsTest < ApplicationSystemTestCase
  setup do
    @lpost = lposts(:one)
  end

  test "visiting the index" do
    visit lposts_url
    assert_selector "h1", text: "Lposts"
  end

  test "should create lpost" do
    visit lposts_url
    click_on "New lpost"

    fill_in "Content", with: @lpost.content
    fill_in "Luser", with: @lpost.luser_id
    fill_in "Title", with: @lpost.title
    click_on "Create Lpost"

    assert_text "Lpost was successfully created"
    click_on "Back"
  end

  test "should update Lpost" do
    visit lpost_url(@lpost)
    click_on "Edit this lpost", match: :first

    fill_in "Content", with: @lpost.content
    fill_in "Luser", with: @lpost.luser_id
    fill_in "Title", with: @lpost.title
    click_on "Update Lpost"

    assert_text "Lpost was successfully updated"
    click_on "Back"
  end

  test "should destroy Lpost" do
    visit lpost_url(@lpost)
    click_on "Destroy this lpost", match: :first

    assert_text "Lpost was successfully destroyed"
  end
end
