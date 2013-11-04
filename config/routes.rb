Wishlist::Application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup', to: 'users#new', as: 'signup'

  resources :users, :products, :sessions
  resources :wishes, :only => [:destroy, :create, :index]

  root 'products#index'
end
