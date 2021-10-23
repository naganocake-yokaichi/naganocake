class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
    @item_tax_price = (@item.price * 1.1).round

  end

  def edit
  end

  def update
  end

private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active, :genre_id)
  end
end