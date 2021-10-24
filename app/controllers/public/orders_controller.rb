class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @order = Order.new(order_params)

    if params[:order][:address_option] == "1"
      @order.name = @customer.last_name + @customer.first_name
      @order.address = @customer.address
      @order.postcode = @customer.postcode

    elsif params[:order][:address_option] == "2"
      @order.name = Address.find(params[:order][:registered]).name
      @order.address = Address.find(params[:order][:registered]).address
      @order.postcode = Address.find(params[:order][:registered]).postcode

    end

    
  end

  def create
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @order.save
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
  end

  def show
  end


private
  def order_params
    params.require(:order).permit(:name, :address, :postcode, :total_payment)
  end

end
