require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @category = categories(:one)
    #simulate login
  end

  test "should get index" do
      get categories_path
      assert_response :success
  end

  test "should render new" do
    get new_category_path
    assert_response :success
  end

  test "should create category" do
    assert_difference("Category.count") do
      post categories_path, params: { name: "New one" }
    end

    assert_redirected_to category_path(@category)
  end

  test "should show category" do
    get category_path(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_path(@category)
    assert_response :success
  end

  test "should update category" do
    patch update_category_path(@category), params: { category: { name: "NewName" } }
    assert_redirected_to category_path(@category)
  end  

  test "should delete category" do
    assert_difference("Category.count", -1) do
      delete category_path(@category)
    end

    assert_redirected_to categories_path
  end
end