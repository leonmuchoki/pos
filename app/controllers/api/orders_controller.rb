class API::OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :set_order

  def show
  end

  def create
  end

  private
    def authenticate_user
      authenticate_with_http_token do |token|
        @current_user = User.find_by(api_key: token)
      end
    end

    def set_order
      @order = Order.find(params[:order_id])
    end
end
