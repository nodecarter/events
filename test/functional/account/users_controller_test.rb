require 'test_helper'

class Account::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should update user" do
    attr = attributes_for :user, password: "new_password",
                          password_confirmation: "new_password"
    put :update, account_user: attr
    assert_response :redirect
    @user.reload
    assert_equal attr[:full_name], @user.full_name
    assert_equal attr[:email], @user.email
    assert @user.authenticate(attr[:password])
  end

  test "should drop user" do
    delete :destroy
    assert_response :redirect
    deleted_user = User.find_by_email(@user.email)
    assert_nil deleted_user
  end
end
