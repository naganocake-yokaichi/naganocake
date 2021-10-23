class Public::CartItemsController < ApplicationController
  before_action :setup_cart_item!, only: %i[index create]

  #cart_item = CartItem.new(cart_item_params)
  #item = Item.find_by(params[:cart_item_id])
  #cart_item.customer_id = current_customer.id
  #cart_item.item_id = item.id
  #cart_item.save
  #redirect_to cart_items_path

  def create
    @cart_item ||= current_cart.cart_items.build(item_id: params[:item_id])
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to cart_items_path
  end


  def index
    @cart_items = current_cart.cart_items.includes([:item])
    #@item_tax_price = (@item.price*1.1).round
  end

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end
end
