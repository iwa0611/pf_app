Rails.application.routes.draw do
  
  root                  to: "hobbyspot/home#index"
  devise_for(:admins, path: 'admins', module: 'admins')

  namespace :hobbyspot do
    get "/",                  to: "home#index"
    get "users/mypage",       to: "users#mypage"
    get 'users/comments/new', to: "comments#new"
    devise_for(:users, path: 'users', module: 'users')
    resources :posts, except: [:index]
    resources :users, only: [:destroy]
    resources :comments, only: [:create, :destroy]
  end
end
