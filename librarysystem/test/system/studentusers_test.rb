require "application_system_test_case"

class StudentusersTest < ApplicationSystemTestCase
  setup do
    @studentuser = studentusers(:one)
  end

  test "visiting the index" do
    visit studentusers_url
    assert_selector "h1", text: "Studentusers"
  end

  test "creating a Studentuser" do
    visit studentusers_url
    click_on "New Studentuser"

    fill_in "Email", with: @studentuser.email
    fill_in "Maxborrowdays", with: @studentuser.maxborrowdays
    fill_in "Name", with: @studentuser.name
    fill_in "University", with: @studentuser.university
    click_on "Create Studentuser"

    assert_text "Studentuser was successfully created"
    click_on "Back"
  end

  test "updating a Studentuser" do
    visit studentusers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @studentuser.email
    fill_in "Maxborrowdays", with: @studentuser.maxborrowdays
    fill_in "Name", with: @studentuser.name
    fill_in "University", with: @studentuser.university
    click_on "Update Studentuser"

    assert_text "Studentuser was successfully updated"
    click_on "Back"
  end

  test "destroying a Studentuser" do
    visit studentusers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Studentuser was successfully destroyed"
  end
end
