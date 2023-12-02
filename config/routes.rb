Rails.application.routes.draw do

  get 'signup',   to: 'users#new',        as: 'signup'
  get 'login',    to: 'sessions#new',     as: 'login'
  delete 'logout',   to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :users
  resources :feeds do
  	resources :entries, only: [:index, :show]
  end

  resources :posts do
    collection do
      get 'search'
    end
  end
  
  resources :properties, only: [:show]
  root 'home#index'

end
