ShoeShop::Application.routes.draw do
  root to: 'posts#index'
  
  resources :posts do 
    resources :images, shallow: true
  end
  resources :users
  get 'profile' => 'users#profile'
    
  resource :sessions, only: [:new, :create, :destroy]

  scope '/admin' do
    resources :sizes
  end

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
end
