Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/new'
  get 'users/new'
  root 'users#index'
  get  '/help',    to: 'static_pages#help'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  post 'conversations/new_access_con'
  get 'messages/access'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/access',     to: 'users#alist'
  resources :users
  resources :microposts,          only: [:create, :destroy]
  resources :items
  resources :conversations do
    resources :messages
  end
  resources :users do
    member do
      get :receivers, :donors
    end
  end
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
