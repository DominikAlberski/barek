Rails.application.routes.draw do
  devise_for :users
  get 'main/index'
  root 'main#index'
  resources :alcohols, only: %I(index show new ceate)
  resources :vodkas, only: %I(new create)
  resources :coctails, only: %I(index show new create destroy) do
    resources :other_ingredients, only: %I(new create)
    resources :simple_alcohols, only: %I(new create)
  end
  resources :ingredients, only: %I(edit update)
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
