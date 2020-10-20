Rails.application.routes.draw do
  resources :courses

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'courses#index'

end
