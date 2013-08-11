ShoeShop::Application.routes.draw do
  resources :posts
  resources :users
  
  resource :sessions, only: [:new, :create, :destroy]

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  root to: 'posts#index'
end
