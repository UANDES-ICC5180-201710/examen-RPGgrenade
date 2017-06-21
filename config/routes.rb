Rails.application.routes.draw do
  resources :purchases
  devise_for :users

  resources :games
  resources :users

  root to: 'games#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
