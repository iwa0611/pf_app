Rails.application.routes.draw do
  namespace :hobbyspot do
    get "/",           to: "home#index"
    get "users",       to: "users#sign_up"
    get "users/login", to: "users#login"
  end
end
