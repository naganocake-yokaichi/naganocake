class Public::CartItemsController < ApplicationController

  def create
  cart_item = CartItem.new(cart_item_params)
  item = Item.find(params[:id])
  cart_item.customer_id = current_customer.id
  cart_item.item_id = item.id
  redirect_to cart_items
  end

  def index
    cart_items = CartItem.all
  end

  private

  end


end
