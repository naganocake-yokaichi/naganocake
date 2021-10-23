class Public::CartItemsController < ApplicationController

  def create
  cart_item = CartItem.new(cart_item_params)
  item = Item.find_by(params[:cart_item_id])
  cart_item.customer_id = current_customer.id
  cart_item.item_id = item.id
  cart_item.save
  redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.all
  end

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end


end
