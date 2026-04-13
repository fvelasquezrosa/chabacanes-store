Rails.application.routes.draw do
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

  # Static Pages
  get "/pages/:slug", to: "pages#show", as: "page"
  get "/about", to: redirect("/pages/about")
  get "/contact", to: redirect("/pages/contact")
end