require "test_helper"
class SessionsControllerTest < ActionDispatch::IntegrationTest


  test "should authenticate user" do   
    @user = User.create(name: "Dory", email: "dory@gmail.com", password_digest: BCrypt::Password.create("PassWord1231"), password_confirmation: "PassWord1231")
    assert @user.save, "Successfully registered"

    @user.authenticate("PassWord1231")
    assert_redirected_to categories_url
  end
end
