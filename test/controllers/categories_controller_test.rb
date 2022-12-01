require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

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

  test "should get create" do
    assert_difference("Category.count") do
      post create_category_url, params: { category: { name: @category.name } }
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
    patch update_category_url(@category), params: { category: { name: @category.name } }
    assert_redirected_to categories_url(@category)
  end  

  test "should delete category" do
    assert_difference("Category.count", -1) do
      delete delete_category_url(@category)
    end

    assert_redirected_to categories_url
  end
end