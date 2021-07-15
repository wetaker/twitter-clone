Rails.application.routes.draw do
  get 'tweets/index'
  get 'tweets/show'
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tweets
  resources :users, only: [:index, :show]
  resources :mentionings, only: [:create, :destroy]
  resources :followings, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :retweets, only: [:create, :destroy]
  resources :profiles, only: [:new, :update]

  get 'home', to: 'tweets#index'
  root to: 'tweets#index'
end
