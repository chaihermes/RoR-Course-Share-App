Rails.application.routes.draw do

  #deixa o responds dentro de avaliations:
  resources :avaliations do 
    resources :responds
  end

  resources :courses

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

end
