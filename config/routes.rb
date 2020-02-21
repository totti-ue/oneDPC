Rails.application.routes.draw do
  root to: "tops#index"
  # resources :tops
  resources :posts, only: [:index, :new]
   # resources :users, only: :index
  devise_for :users



end
