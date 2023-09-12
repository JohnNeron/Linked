require "application_system_test_case"

class LpostulationsTest < ApplicationSystemTestCase
  setup do
    @lpostulation = lpostulations(:one)
  end

  test "visiting the index" do
    visit lpostulations_url
    assert_selector "h1", text: "Lpostulations"
  end

  test "should create lpostulation" do
    visit lpostulations_url
    click_on "New lpostulation"

    fill_in "Kind", with: @lpostulation.kind
    fill_in "Lpost", with: @lpostulation.lpost_id
    fill_in "Luser", with: @lpostulation.luser_id
    click_on "Create Lpostulation"

    assert_text "Lpostulation was successfully created"
    click_on "Back"
  end

  test "should update Lpostulation" do
    visit lpostulation_url(@lpostulation)
    click_on "Edit this lpostulation", match: :first

    fill_in "Kind", with: @lpostulation.kind
    fill_in "Lpost", with: @lpostulation.lpost_id
    fill_in "Luser", with: @lpostulation.luser_id
    click_on "Update Lpostulation"

    assert_text "Lpostulation was successfully updated"
    click_on "Back"
  end

  test "should destroy Lpostulation" do
    visit lpostulation_url(@lpostulation)
    click_on "Destroy this lpostulation", match: :first

    assert_text "Lpostulation was successfully destroyed"
  end
end
