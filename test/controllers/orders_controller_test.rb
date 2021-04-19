require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end
  


  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  # test "should create order" do
  #   assert_difference('Order.count') do
  #     post orders_url, params: { order: { category_id: @order.category_id, currency: @order.currency, discount_amount: @order.discount_amount, first_name: @order.first_name, gross_amount: @order.gross_amount, last_name: @order.last_name, net_amount: @order.net_amount } }
  #   end

  #   assert_redirected_to order_url(Order.last)
  # end

  # test "should not create order" do
  #   not assert_no_difference('Order.count') do
  #     post orders_url, params: { order: { category_id: @category.category_id, currency: @order.currency, discount_amount: @order.discount_amount, first_name: '', gross_amount: @order.gross_amount, last_name: @order.last_name, net_amount: @order.net_amount } }
  #   end

  # end
  # test "should show order" do
  #   get order_url(@order)
  #   assert_response :success
  # end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  # test "should update order" do
  #   patch order_url(@order), params: { order: { category_id: @order.category_id, currency: @order.currency, discount_amount: @order.discount_amount, first_name: @order.first_name, gross_amount: @order.gross_amount, last_name: @order.last_name, net_amount: @order.net_amount } }
  #   assert_redirected_to order_url(@order)
  # end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
