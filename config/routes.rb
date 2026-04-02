Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  root "products#index"

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
end