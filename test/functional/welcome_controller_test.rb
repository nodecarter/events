require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index when logged in" do
    user = create :user
    sign_in user
    get :index
    assert_response :success
  end

  test "should redirect when guest" do
    get :index
    assert_response :redirect
  end
end
