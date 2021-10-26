class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(10)
  end


  def show
    @customer = Customer.find(params[:id])
  end


  def edit
    @customer = Customer.find(params[:id])
  end


  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice]= "会員情報を変更しました"
      redirect_to admin_customer_path
    else
      flash[:alert]= "会員情報の変更に失敗しました"
      render edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number,:email,:is_deleted)
  end
end