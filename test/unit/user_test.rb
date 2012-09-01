require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should always return user to_s" do
    user_without_full_name = create :user, full_name: ""
    assert_present user_without_full_name.to_s
  end
end
