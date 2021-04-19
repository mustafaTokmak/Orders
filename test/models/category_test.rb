require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  
  test "should save with required fields" do
    category = Category.new(category_name:'category_name')
    category.valid?
    assert category.save
  end

  test "should not save with empty category_name" do
    category = Category.new()
    category.valid?
    assert_not category.save
  end
end
