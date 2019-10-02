require "application_system_test_case"

class OweMoneysTest < ApplicationSystemTestCase
  setup do
    @owe_money = owe_moneys(:one)
  end

  test "visiting the index" do
    visit owe_moneys_url
    assert_selector "h1", text: "Owe Moneys"
  end

  test "creating a Owe money" do
    visit owe_moneys_url
    click_on "New Owe Money"

    fill_in "Overdue fine", with: @owe_money.overdue_fine
    click_on "Create Owe money"

    assert_text "Owe money was successfully created"
    click_on "Back"
  end

  test "updating a Owe money" do
    visit owe_moneys_url
    click_on "Edit", match: :first

    fill_in "Overdue fine", with: @owe_money.overdue_fine
    click_on "Update Owe money"

    assert_text "Owe money was successfully updated"
    click_on "Back"
  end

  test "destroying a Owe money" do
    visit owe_moneys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Owe money was successfully destroyed"
  end
end
