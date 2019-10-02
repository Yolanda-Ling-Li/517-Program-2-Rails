require 'test_helper'

class OweMoneysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owe_money = owe_moneys(:one)
  end

  test "should get index" do
    get owe_moneys_url
    assert_response :success
  end

  test "should get new" do
    get new_owe_money_url
    assert_response :success
  end

  test "should create owe_money" do
    assert_difference('OweMoney.count') do
      post owe_moneys_url, params: { owe_money: { overdue_fine: @owe_money.overdue_fine } }
    end

    assert_redirected_to owe_money_url(OweMoney.last)
  end

  test "should show owe_money" do
    get owe_money_url(@owe_money)
    assert_response :success
  end

  test "should get edit" do
    get edit_owe_money_url(@owe_money)
    assert_response :success
  end

  test "should update owe_money" do
    patch owe_money_url(@owe_money), params: { owe_money: { overdue_fine: @owe_money.overdue_fine } }
    assert_redirected_to owe_money_url(@owe_money)
  end

  test "should destroy owe_money" do
    assert_difference('OweMoney.count', -1) do
      delete owe_money_url(@owe_money)
    end

    assert_redirected_to owe_moneys_url
  end
end
