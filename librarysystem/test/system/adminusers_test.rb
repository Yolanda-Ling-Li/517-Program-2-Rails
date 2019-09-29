require "application_system_test_case"

class AdminusersTest < ApplicationSystemTestCase
  setup do
    @adminuser = adminusers(:one)
  end

  test "visiting the index" do
    visit adminusers_url
    assert_selector "h1", text: "Adminusers"
  end

  test "creating a Adminuser" do
    visit adminusers_url
    click_on "New Adminuser"

    fill_in "Email", with: @adminuser.email
    fill_in "Name", with: @adminuser.name
    fill_in "Password", with: @adminuser.password
    click_on "Create Adminuser"

    assert_text "Adminuser was successfully created"
    click_on "Back"
  end

  test "updating a Adminuser" do
    visit adminusers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @adminuser.email
    fill_in "Name", with: @adminuser.name
    fill_in "Password", with: @adminuser.password
    click_on "Update Adminuser"

    assert_text "Adminuser was successfully updated"
    click_on "Back"
  end

  test "destroying a Adminuser" do
    visit adminusers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adminuser was successfully destroyed"
  end
end
