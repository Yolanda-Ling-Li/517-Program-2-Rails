require "application_system_test_case"

class BookApprovalsTest < ApplicationSystemTestCase
  setup do
    @book_approval = book_approvals(:one)
  end

  test "visiting the index" do
    visit book_approvals_url
    assert_selector "h1", text: "Book Approvals"
  end

  test "creating a Book approval" do
    visit book_approvals_url
    click_on "New Book Approval"

    click_on "Create Book approval"

    assert_text "Book approval was successfully created"
    click_on "Back"
  end

  test "updating a Book approval" do
    visit book_approvals_url
    click_on "Edit", match: :first

    click_on "Update Book approval"

    assert_text "Book approval was successfully updated"
    click_on "Back"
  end

  test "destroying a Book approval" do
    visit book_approvals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book approval was successfully destroyed"
  end
end
