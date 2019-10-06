require 'test_helper'

class BookApprovalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_approval = book_approvals(:one)
  end

  test "should get index" do
    get book_approvals_url
    assert_response :success
  end

  test "should get new" do
    get new_book_approval_url
    assert_response :success
  end

  test "should create book_approval" do
    assert_difference('BookApproval.count') do
      post book_approvals_url, params: { book_approval: {  } }
    end

    assert_redirected_to book_approval_url(BookApproval.last)
  end

  test "should show book_approval" do
    get book_approval_url(@book_approval)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_approval_url(@book_approval)
    assert_response :success
  end

  test "should update book_approval" do
    patch book_approval_url(@book_approval), params: { book_approval: {  } }
    assert_redirected_to book_approval_url(@book_approval)
  end

  test "should destroy book_approval" do
    assert_difference('BookApproval.count', -1) do
      delete book_approval_url(@book_approval)
    end

    assert_redirected_to book_approvals_url
  end
end
