class Public::CartItemsController < ApplicationController

  #before_action :set_cart_items, only: [:create, :index, :destroy]
  before_action :set_customer

  def create
    @cart_item = @customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    @cart = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    @cart.amount += params[:cart_item][:amount].to_i
    @cart.save
    redirect_to cart_items_path
    else
    @cart_item.save
    redirect_to cart_items_path
    end
  end

  def index
    @cart_items = current_customer.cart_items.all
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def set_customer
    @customer = current_customer
  end

  def set_cart_items
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end