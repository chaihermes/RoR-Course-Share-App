Rails.application.routes.draw do
  #deixa o preply dentro de discussions:
  resources :discussions do 
    resources :replies
  end

  resources :line_items
  resources :carts
  resources :courses 

  #Pesquisar como colocar uma rota dentro da outra: (precisa colocar a ação [do])
  resources :courses do
    resources :discussions do
      resources :replies
    end
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'courses#index'

end
