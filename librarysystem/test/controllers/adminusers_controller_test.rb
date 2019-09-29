require 'test_helper'

class AdminusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adminuser = adminusers(:one)
  end

  test "should get index" do
    get adminusers_url
    assert_response :success
  end

  test "should get new" do
    get new_adminuser_url
    assert_response :success
  end

  test "should create adminuser" do
    assert_difference('Adminuser.count') do
      post adminusers_url, params: { adminuser: { email: @adminuser.email, name: @adminuser.name, password: @adminuser.password } }
    end

    assert_redirected_to adminuser_url(Adminuser.last)
  end

  test "should show adminuser" do
    get adminuser_url(@adminuser)
    assert_response :success
  end

  test "should get edit" do
    get edit_adminuser_url(@adminuser)
    assert_response :success
  end

  test "should update adminuser" do
    patch adminuser_url(@adminuser), params: { adminuser: { email: @adminuser.email, name: @adminuser.name, password: @adminuser.password } }
    assert_redirected_to adminuser_url(@adminuser)
  end

  test "should destroy adminuser" do
    assert_difference('Adminuser.count', -1) do
      delete adminuser_url(@adminuser)
    end

    assert_redirected_to adminusers_url
  end
end
