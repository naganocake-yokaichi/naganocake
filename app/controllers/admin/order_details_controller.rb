class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  before_action :authenticate_customer!,except: [:update]
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_params)
    redirect_to admin_order_path(@order)
  end

  def order_params
     params.require(:order_detail).permit(:make_status)
  end

end
