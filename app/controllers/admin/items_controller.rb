class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :authenticate_customer!,except: [:index,:show,:create,:new,:edit,:update]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item), notice: "successfully"
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @item_tax_price = (@item.price * 1.1).round

  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id), notice: "successfully"
    else
      render :edit
    end
  end

private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active, :genre_id)
  end
end