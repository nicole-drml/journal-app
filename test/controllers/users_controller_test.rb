require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { name: "Villanelle", email: "k.eve@yahoo.com", password: "mUc3m00RsqyRe", password_confirmation: "mUc3m00RsqyRe" } }
    end

    assert_redirected_to user_url(User.last)

    #assert_redirected_to categories_url(@category)
  end

end
