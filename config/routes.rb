Rails.application.routes.draw do
  root to: "tops#index"
  resources :posts
  devise_for :users



end
