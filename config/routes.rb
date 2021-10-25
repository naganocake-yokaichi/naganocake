Rails.application.routes.draw do
  #会員
  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:show, :index]
    resources :orders, only: [:index, :show, :new, :create] do
      collection do
        post :confirm
      end
    end
    get "orders/thanks" => "orders#thanks"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resource "customers", only: [:show, :edit, :update]
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
  end

  #管理者
  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end
  #認証機能
  #会員
  devise_for :customers,skip: [:password,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  #管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
end