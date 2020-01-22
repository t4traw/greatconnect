Rails.application.routes.draw do
  root 'home#index'
  
  get 'sessions/new'
  
  resources :users
  resources :items
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  
  get 'likes/index'
  post '/likes', to: 'likes#create'
  delete '/likes', to: 'likes#destroy'
  
  get 'comments/new'
  post '/comments', to: 'comments#create'
  
  get "items/:id/edit" => "items#edit"
  post "items/:id/update" => "items#update"
  post "items/:id/destroy" => "items#destroy"
  
  
   
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
