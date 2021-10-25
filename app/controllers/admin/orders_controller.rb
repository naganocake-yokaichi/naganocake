class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  def updated
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @order.update(order_params)
  end

  private
  def order_params
     params.require(:order).permit(:status)
  end
end
