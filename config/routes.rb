Rails.application.routes.draw do
  root to: "tops#index"
  resources :posts
  # resources :users, only: :index

  # devise_for :users

end
