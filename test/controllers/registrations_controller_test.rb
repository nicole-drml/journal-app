require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sign_up_new_path
    assert_response :success
  end

  test "should create user" do
    assert_difference "User.count" do
      post sign_up_path, params: { user: { name: "New Wan", email: "newOne@yahoo.com", password_digest: BCrypt::Password.create('Password12345!') } }
    end
  end

end
