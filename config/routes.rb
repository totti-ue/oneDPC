Rails.application.routes.draw do
  
  root to: "tops#index"
  devise_for :users
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show

end
