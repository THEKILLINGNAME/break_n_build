Rails.application.routes.draw do
  root "home#index"

  authenticate :user, lambda { |u| u.admin == true } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  devise_for :users

  resources :products, only: [:index, :show]
end
