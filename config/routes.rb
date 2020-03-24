Rails.application.routes.draw do
  
  root to: "tops#index"
  resources :tops, only: [:index, :show]
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:index, :show]
  resources :themes, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]


end
