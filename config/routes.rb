Rails.application.routes.draw do
  resources :products
  
  #deixa o responds dentro de avaliations:    Se comentar essa parte, as respotas "se perdem"
  resources :avaliations do 
    resources :responds
  end

  # resources :courses do
  #   resources :avaliations    #exibe as avaliações de cada curso
  #   collection do
  #     get :search   #cria uma nova rota para a busca
  #   end
  # end

  resources :products do  
    resources :avaliations       #exibe as avaliações de cada curso
    collection do
      get :search   #cria uma nova rota para a busca
    end
  end

  resources :avaliations
  resources :line_items
  resources :carts

  devise_for :users, controllers: { registrations: 'registrations' }

  #root 'courses#index'
  root 'products#index'

end