PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts, except: [:destroy] do
  	resources :comments, only: [:create]
  end
  
  resources :categories, except: [:edit, :update, :destroy]
  resources :users, only: [:create, :show]
end
