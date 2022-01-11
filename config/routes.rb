Rails.application.routes.draw do
  namespace :hobbyspot do
    get "/",            to: "home#index"
    get "users/mypage", to: "users#mypage"
    devise_for(:users, path: 'users', module: 'users')
    resources :posts, only: [:create, :edit, :update, :new, :destroy]
  end
end
