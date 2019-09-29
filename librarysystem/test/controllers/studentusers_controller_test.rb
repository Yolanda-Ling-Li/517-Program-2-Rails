require 'test_helper'

class StudentusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @studentuser = studentusers(:one)
  end

  test "should get index" do
    get studentusers_url
    assert_response :success
  end

  test "should get new" do
    get new_studentuser_url
    assert_response :success
  end

  test "should create studentuser" do
    assert_difference('Studentuser.count') do
      post studentusers_url, params: { studentuser: { email: @studentuser.email, maxborrowdays: @studentuser.maxborrowdays, name: @studentuser.name, university: @studentuser.university } }
    end

    assert_redirected_to studentuser_url(Studentuser.last)
  end

  test "should show studentuser" do
    get studentuser_url(@studentuser)
    assert_response :success
  end

  test "should get edit" do
    get edit_studentuser_url(@studentuser)
    assert_response :success
  end

  test "should update studentuser" do
    patch studentuser_url(@studentuser), params: { studentuser: { email: @studentuser.email, maxborrowdays: @studentuser.maxborrowdays, name: @studentuser.name, university: @studentuser.university } }
    assert_redirected_to studentuser_url(@studentuser)
  end

  test "should destroy studentuser" do
    assert_difference('Studentuser.count', -1) do
      delete studentuser_url(@studentuser)
    end

    assert_redirected_to studentusers_url
  end
end
