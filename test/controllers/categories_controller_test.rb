require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
      get categories_url
      assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should post create" do
    assert_difference("Category.count") do
      post categories_url, params: { category: { name: "Personal" } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should get show" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should patch update" do
    patch update_category_url(@category), params: { category: { name: "NewName" } }
    assert_redirected_to category_url(@category)
  end  

  test "should delete category" do
    assert_difference("Category.count", -1) do
      delete delete_category_url(@category)
    end

    assert_redirected_to categories_url
  end
end