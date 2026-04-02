Rails.application.routes.draw do
  get "categories/show"
  get "products/index"
  get "products/show"
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)

  root "products#index"

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
end