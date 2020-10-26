Rails.application.routes.draw do

  #deixa o responds dentro de avaliations:
  resources :avaliations do 
    resources :responds
  end

  resources :courses do
    #resources :avaliations
    collection do
      get :search   #cria uma nova rota para a busca
    end
  end

  #FIXME: pra msotrar a avaliação e a resposta dentro de cursos
  # resources :courses do
  #   resources :avaliations do
  #     resources :responds
  #   end
  # end

  resources :avaliations
  resources :line_items
  resources :carts

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'courses#index'

  #get 'search', to: "courses#search"

end
