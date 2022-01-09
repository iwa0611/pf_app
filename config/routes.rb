Rails.application.routes.draw do
  namespace :hobbyspot do
    get "/",            to: "home#index"
    get "users/mypage", to: "users#mypage"
    get "users/post",   to: "posts#new"
    devise_for(:users, path: 'users', module: 'users')
  end
end
