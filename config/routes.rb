Rails.application.routes.draw do

  root 'posts#index'
  
  
  get "users/new" => "users#new"
  get "posts/new" => "posts#new"
  post "users/create" => "users#create"
  post "posts/create" => "posts#create"
  
  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'

  get "login" => "users#login"
  get "/posts/:id" => "posts#show"
  get "/users/:id" => "users#show"
  get "/users/edit/:id" => "users#edit"
  post "/users/update/:id" => "users#update"
  
  
  delete "/posts/destroy/:id" => "posts#destroy"

  resource :post
  resource :user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end