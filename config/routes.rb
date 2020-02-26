Rails.application.routes.draw do
  
  root to: "tops#index"
  devise_for :users
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
      get 'rank'
    end
  end
  resources :users, only: [:index, :show]

end
