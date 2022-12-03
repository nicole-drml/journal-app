require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "should not save User without a name" do
    user = User.new
    user.name = ''
    assert_not user.save, "Saved the user without a name"
  end

  test "should not save User without an email" do
    user = User.new
    user.email = ''
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save User without a password" do
    user = User.new
    user.password_digest = ''
    assert_not user.save, "Saved the user without a password"
  end

  test "should not save User if email already exists" do
    user = User.new
    user.email = 'ndrml@yahoo.com'
    user.password_digest = "nicole_doromal26"
    assert user.save, "Saved with unique email" 

    user = User.new
    user.email = 'ndrml@yahoo.com'
    user.password_digest = "nicole_doromal26"
    assert_not user.save, "Saved the user with an existing email" 
  end
end
