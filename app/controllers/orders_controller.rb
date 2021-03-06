class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    # parsed_data = JSON.parse(order_params.to_json)
    # if parsed_data['discount_amount'] != ''
    #   parsed_data["net_amount"] = (parsed_data["gross_amount"].to_i - parsed_data["discount_amount"].to_i).to_s
    # else
    #   parsed_data["net_amount"] = parsed_data["net_amount"]
    # end
    @order = Order.new(order_params)
    @order.net_amount = @order.gross_amount - @order.discount_amount 
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
    # TODO create ile birlestirilecek
    parsed_data = JSON.parse(order_params.to_json)
    if parsed_data['discount_amount'] != ''
      parsed_data["net_amount"] = (parsed_data["gross_amount"].to_i - parsed_data["discount_amount"].to_i).to_s
    else
      parsed_data["net_amount"] = parsed_data["net_amount"]
    end

      if @order.update(parsed_data)

        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:currency, :first_name, :last_name, :gross_amount, :discount_amount, :net_amount, :category_id)
    end
end
