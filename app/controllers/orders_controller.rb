class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  	@order = Order.new
  	@foods = Food.all
  	@drinks = Drink.all
    @rtables = RestaurantTable.all
  end

  def create
  	@order = Order.new(order_params)
    
    respond_to do |format|
      if @order.save!
        format.html { render :show, notice: "Order created successfully." }
        format.json { render json: @order }
      else
        format.html { render :new, notice: "Order was not created!" }
        format.json { render json: @order.errors }
      end
    end
  end

  private
    def order_params
      params.require(:order).permit(:amount, :processed, :user_id, :restaurant_table_id, 
      	                            order_foods_attributes: [:food_id,:quantity,:amount])
    end
end
