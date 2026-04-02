Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)

  root "products#index"

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show], controller: "cart"
  post "cart/add/:id", to: "cart#add", as: "add_to_cart"
end