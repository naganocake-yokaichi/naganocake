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

    # sum = 0とし、初期値を設定する。
    # アイテムの値段＊個数を品数分足していく。
    # item.add_tax_priceはitem.rbに消費税分(1.1)をかけるという式を定義したもの。
    sum = 0
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      sum += (cart_item.item.add_tax_price * cart_item.amount)
    end

    # sumで商品の合計が出たので、ここに送料を足す。
    # 以上で、請求金額を定義出来るようになる。
    sum += @order.carriage
    @order.total_payment = sum

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    cart_items = current_customer.cart_items
    @order.save
    redirect_to orders_thanks_path
    # データを保存した後に、カートの中身を全て空にする。
    cart_items.destroy_all
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
  end


private
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :carriage, :total_payment, :pay_method, :status)
  end

end
