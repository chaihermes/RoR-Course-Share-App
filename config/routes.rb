Rails.application.routes.draw do
  resources :courses
  root 'store#index'

  devise_for :users, controllers: { registrations: 'registrations' }

end
