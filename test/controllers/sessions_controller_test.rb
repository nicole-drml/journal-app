require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = users(:one)
  end

  test "should login user" do
=begin
    user = User.create(:user)
    controller.session[:user_id] = user.id
    get 'users'
    expect(@users.size).to eq(1)
=end

    assert_difference("User.count") do
      post users_url, params: { user: { name: @user.name, email: @user.email, password: @user.password } }
    end

    assert_redirected_to categories_url(@category)
  end
end
