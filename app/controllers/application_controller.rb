class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number])
  end

   helper_method :current_cart

  def current_cart
    if current_customer
      # ユーザーとカートの紐付け
      current_cart = current_customer.cart_items || current_customer.create_cart_items!
    else
      # セッションとカートの紐付け
      current_cart = CartItem.find_by(id: session[:customer_id]) || Cart.create
      session[:customer_id] ||= current_cart.id
    end
    current_cart
  end

end
