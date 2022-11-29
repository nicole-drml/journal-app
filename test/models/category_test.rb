require "test_helper"


class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save Category without name" do
    category = Category.new
    category.name = ''
    assert_not category.save, "Saved the category without a name"
  end

  test "should not save Category if name already exists" do
    category = Category.new
    category.name = 'School'
    assert category.save, "Saved with unique name" 

    category = Category.new
    category.name = 'School'
    assert_not category.save, "Saved the category with an existing name" 
  end

  test "should be able to update category name" do
    category = Category.new
    category.name = 'School'
    category.save
    id = category.id
    assert Category.update(name: 'Work'), "Category name updated"
  end

  test "should be able to show category name" do
    category = Category.new
    category.name = 'School'
    category.save
    id = category.id
    refute_nil Category.find(id), "Category exists"
    assert_equal Category.find(id).details, 'School'
  end
end
