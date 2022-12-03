require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { name: @user.name, email: @user.email, password_digest: @user.password_digest } }
    end

    assert_redirected_to categories_url(@category)
  end

end
