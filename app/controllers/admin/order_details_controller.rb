class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  before_action :authenticate_customer!,except: [:update]
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_params)
    if @order_detail.make_status_before_type_cast == 2
      @order.update(status: 2)
      redirect_to request.referer
    elsif @order_detail.make_status_before_type_cast == 3
      @order.order_details.each do |order_detail|
        if order_detail.make_status_before_type_cast == 3
          @order.update(status: 3)
        else
          @order.update(status: 2)
          break
        end
      end
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def order_params
     params.require(:order_detail).permit(:make_status)
  end

end
