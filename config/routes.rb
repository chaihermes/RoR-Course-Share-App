Rails.application.routes.draw do

  #deixa o preply dentro de discussions:
  # resources :discussions do 
  #   resources :replies
  # end
  resources :courses

  resources :courses do
    resources :avaliations do
      resources :responds
    end
  end

  resources :avaliations
  resources :line_items
  resources :carts

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'courses#index'

end
