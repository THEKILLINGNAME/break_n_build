Rails.application.routes.draw do
  get 'shopping_cart/index'
  root "home#index"

  # For check if user is admin
  authenticate :user, lambda { |u| u.admin == true } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  # Devise routes for it works, when generate custom controllers
  devise_for :users, controllers: {
    confirmations: 'users/confirmations', passwords: 'users/passwords',
    registrations: 'users/registrations', sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  resources :products, only: [:index, :show]

  delete "products/delete_category", to: "products#delete_category", as: "delete_category"

  post "product/:id/add_to_cart", to: "products#show_add_to_cart", as: "product_add_to_cart"
  delete "product/:id/remove_from_cart", to: "products#show_remove_from_cart", as: "product_remove_from_cart"

  post "shopping_cart/add_to_cart/:id", to: "shopping_cart#add_to_cart", as: "shopping_cart_add_to_cart"
  delete "shopping_cart/remove_from_cart/:id", to: "shopping_cart#remove_from_cart", as: "shopping_cart_remove_from_cart"
  delete "shopping_cart/delete_from_cart/:id", to: "shopping_cart#delete_from_cart", as: "shopping_cart_delete_from_cart"
  get "shopping_cart/place_order", to: "shopping_cart#place_order", as: "shopping_cart_place_order"
end
