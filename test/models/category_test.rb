require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save Category without name" do
      category = Category.new
      category.name = ''
      assert_not category.save, "Saved the Category without a name"
  end

  test "should not save Category if name already exists" do
    category = Category.new
    category.name = 'School'
    assert category.save, "Saved with unique name" 

    category = Category.new
    category.name = 'School'
    assert_not category.save, "Saved the Category with an existing name" 
  end

end
