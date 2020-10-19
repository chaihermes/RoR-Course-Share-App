Rails.application.routes.draw do
  root 'store#index'

  devise_for :users, controllers: { registrations: 'registrations' }

end
