class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :authenticate_customer!,except: [:show, :update]
  def show
    @order = Order.find(params[:id])
  end
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    # _before_type_castはenumを使用している時に使える。条件で数値を選択したいときに使用。
    # if @order.status == "confirmation"でも可
    if @order.status_before_type_cast == 1
      @order_details.update_all(make_status: 1)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private
  def order_params
     params.require(:order).permit(:status)
  end
end
