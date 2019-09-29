require 'test_helper'

class CheckOutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @check_out = check_outs(:one)
  end

  test "should get index" do
    get check_outs_url
    assert_response :success
  end

  test "should get new" do
    get new_check_out_url
    assert_response :success
  end

  test "should create check_out" do
    assert_difference('CheckOut.count') do
      post check_outs_url, params: { check_out: {  } }
    end

    assert_redirected_to check_out_url(CheckOut.last)
  end

  test "should show check_out" do
    get check_out_url(@check_out)
    assert_response :success
  end

  test "should get edit" do
    get edit_check_out_url(@check_out)
    assert_response :success
  end

  test "should update check_out" do
    patch check_out_url(@check_out), params: { check_out: {  } }
    assert_redirected_to check_out_url(@check_out)
  end

  test "should destroy check_out" do
    assert_difference('CheckOut.count', -1) do
      delete check_out_url(@check_out)
    end

    assert_redirected_to check_outs_url
  end
end
