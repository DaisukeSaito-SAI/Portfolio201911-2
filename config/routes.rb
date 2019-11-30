Rails.application.routes.draw do
  get 'users/new'

  root 'posts#index'
  get 'posts/new'
  resource :posts
  resource :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
