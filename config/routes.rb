Rails.application.routes.draw do
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
end
