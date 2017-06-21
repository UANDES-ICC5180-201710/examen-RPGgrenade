Rails.application.routes.draw do
  resources :purchases
  devise_for :users

  resources :purchases do
    post 'add', to: 'purchases#addPurchase', on: :member
    get 'check', to: 'purchases#getPurchase', on: :member
    delete 'remove', to: 'purchases#removePurchase', on: :member
  end
  resources :games
  resources :users

  root to: 'games#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
