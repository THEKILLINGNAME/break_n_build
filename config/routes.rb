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

  post "shopping_cart/add_to_cart/:id", to: "shopping_cart#add_to_cart", as: "add_to_cart"
  delete "shopping_cart/remove_from_cart/:id", to: "shopping_cart#index_remove_from_cart", as: "shopping_cart_remove_from_cart"
  delete "products/remove_from_cart/:id", to: "products#show_remove_from_cart", as: "products_remove_from_cart"
  get "shopping_cart/place_order", to: "shopping_cart#place_order", as: "place_order"
  delete "products/delete_category", to: "products#delete_category", as: "delete_category"

end
