Rails.application.routes.draw do
  root to: "tops#index"
  resources :posts, only: [:index, :new, :create]
   # resources :users, only: :index



end
