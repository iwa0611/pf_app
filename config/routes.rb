Rails.application.routes.draw do
  root                  to: "hobbyspot/home#index"
  devise_for(:admins, path: 'admins', module: 'admins')

  namespace :hobbyspot do
    get "/",            to: "home#index"
    get "users/mypage", to: "users#mypage"
    devise_for(:users, path: 'users', module: 'users')
    resources :posts, except: [:index]
  end
end
