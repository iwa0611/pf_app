Rails.application.routes.draw do
  namespace :hobbyspot do
    get "/",            to: "home#index"
    get "users/login",  to: "users#login"
    get "users/mypage", to: "users#mypage"
    get "users/edit",   to: "users#edit"
    get "users",        to: "users#sign_up"
    get "users/post",   to: "posts#new"
  end
end
