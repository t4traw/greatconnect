Rails.application.routes.draw do
  

  get 'sessions/new'

  root 'home#index'
  resources :users
  resources :items
  
  get 'likes/index'
  post '/likes', to: 'likes#create'
  delete '/likes', to: 'likes#destroy'
  
  get 'comments/new'
  post '/comments', to: 'comments#create'
  
  post "items/:id/destroy" => "items#destroy"
  
  
   
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
