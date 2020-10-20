Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :courses

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'courses#index'

end
