require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "should save with required fields" do 
    order = Order.new(first_name: 'first_name', last_name: 'last_name',currency:'TL',gross_amount:1)
    order.valid?
    assert order.save
  
  end

  test "should not save with empty first_name" do 
    order = Order.new(first_name: '', last_name: 'last_name',currency:'TL',gross_amount:10)
    order.valid?
    assert_not order.save
  end
  test "should not save with empty last_name" do 
    order = Order.new(first_name: 'first_name', last_name: '',currency:'TL',gross_amount:10)
    order.valid?
    assert_not order.save
  end
  test "should not save with empty currency" do 
    order = Order.new(first_name: 'first_name', last_name: 'last_name',currency:'',gross_amount:10)
    order.valid?
    assert_not order.save
  end
  test "should not save with empty gross_amount" do 
    order = Order.new(first_name: 'first_name', last_name: 'last_name',currency:'TL')
    order.valid?
    assert_not order.save
  end
  test "should not save with negative gross_amount" do 
    order = Order.new(first_name: 'first_name', last_name: 'last_name',currency:'TL',gross_amount:-1)
    order.valid?
    assert_not order.save
  end
  test "should not save with negative discount_amount" do 
    order = Order.new(first_name: 'first_name', last_name: 'last_name',currency:'TL',gross_amount:10,discount_amount:-1)
    order.valid?
    assert_not order.save
  end
  test "should not save with discount_amount bigger than gross_amount" do 
    order = Order.new(first_name: 'first_name', last_name: 'last_name',currency:'TL',gross_amount:10,discount_amount:11)
    order.valid?
    assert_not order.save
  end

  
  
  
end

