require "application_system_test_case"

class CheckOutsTest < ApplicationSystemTestCase
  setup do
    @check_out = check_outs(:one)
  end

  test "visiting the index" do
    visit check_outs_url
    assert_selector "h1", text: "Check Outs"
  end

  test "creating a Check out" do
    visit check_outs_url
    click_on "New Check Out"

    click_on "Create Check out"

    assert_text "Check out was successfully created"
    click_on "Back"
  end

  test "updating a Check out" do
    visit check_outs_url
    click_on "Edit", match: :first

    click_on "Update Check out"

    assert_text "Check out was successfully updated"
    click_on "Back"
  end

  test "destroying a Check out" do
    visit check_outs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Check out was successfully destroyed"
  end
end
