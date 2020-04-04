Rails.application.routes.draw do
  
  root to: "tops#index"
  resources :tops, only: [:index, :show]
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
      get 'thanks'
    end
  end
  resources :users, only: [:index, :show]
  resources :themes, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]


end
