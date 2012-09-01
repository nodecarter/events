require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session" do
    attrs = { email: @user.email, password: @user.password }
    post :create, attrs
    assert_response :redirect
    assert signed_in?
    assert_equal current_user, @user
  end

  test "should logout" do
    sign_in @user
    delete :destroy
    assert_response :redirect
    assert current_user.guest?
  end
end
