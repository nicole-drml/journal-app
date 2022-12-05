require "test_helper"


class CategoryTest < ActiveSupport::TestCase
  test "should not save Category without name" do
    category = Category.new
    category.name = ''
    assert_not category.save, "Saved the category without a name"
  end

  test "should not save Category if name already exists" do
    school = Category.new
    school.name = 'School'
    assert_not school.save, "Saved the category with an existing name" 
  end

  test "should be able to update category name" do
    category = Category.new
    category.name = 'School'
    category.save
    id = category.id
    assert Category.update(name: 'Work'), "Category name updated"
  end

end
