require "test_helper"

class SessionTest < ActiveSupport::TestCase
  test "should authenticate user" do   
    @user = User.new(name: "Dory", email: "dory@blue.com", password_digest:BCrypt::Password.create("dory@BLUE"))
    assert @user.save, "Successfully registered"

    session = User.find_by(email: "dory@blue.com")
    session.authenticate("BLUE")
    assert_redirected_to categories_path
  end
end
