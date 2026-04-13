Rails.application.routes.draw do
  get "orders/show"
  get "checkout/new"
  get "checkout/create"
  # Devise (Admin + Users)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  # ActiveAdmin routes
  ActiveAdmin.routes(self)

  # Storefront (Main)
  root "products#index"

  # Products & Categories (Frontend)
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  # Cart (Session-based)
  get "/cart", to: "cart#show", as: "cart"
  post "/cart/add/:id", to: "cart#add", as: "add_to_cart"
  patch "/cart/update/:id", to: "cart#update", as: "update_cart"
  delete "/cart/remove/:id", to: "cart#remove", as: "remove_from_cart"
  get "/checkout", to: "checkout#new", as: "checkout"
  post "/checkout", to: "checkout#create"
  resources :orders, only: [:index, :show]

  # Static Pages
  get "/pages/:slug", to: "pages#show", as: "page"
  get "/about", to: redirect("/pages/about")
  get "/contact", to: redirect("/pages/contact")
end