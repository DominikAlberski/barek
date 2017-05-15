Rails.application.routes.draw do
  devise_for :users
  get 'main/index'
  root 'main#index'
  resources :alcohols
  resources :vodkas

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
