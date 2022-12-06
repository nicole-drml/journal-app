require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get sign_up_new_path
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post sign_up_path, params: { user: { name: "Juan Cruz", email: "ph.tc@yahoo.com", password: "Dito_sa_23", password_confirmation: "Dito_sa_23" } }
    end

    assert_redirected_to '/'
  end

end
