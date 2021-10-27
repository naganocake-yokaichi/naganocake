class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!,except: [:index, :show]
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @item_tax_price = (@item.price*1.1).round
  end

end
