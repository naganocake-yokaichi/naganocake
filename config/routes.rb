Rails.application.routes.draw do
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
