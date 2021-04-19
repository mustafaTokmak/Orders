require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "empty category name" do
    category = Category.new(category_name : 'a' )
    category.valid?

  end
end
