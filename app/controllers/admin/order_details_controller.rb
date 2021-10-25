class Admin::OrderDetailsController < ApplicationController
  def updated
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_params)
  end

  def order_params
     params.require(:order_detail).permit(:make_status)
  end

end
