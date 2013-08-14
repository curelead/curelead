ShoeShop::Application.routes.draw do

  resources :posts do 
    resources :images, shallow: true
  end
  resources :users
  get 'profile' => 'users#profile'
  
  
  resource :sessions, only: [:new, :create, :destroy]

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  root to: 'posts#index'
end
