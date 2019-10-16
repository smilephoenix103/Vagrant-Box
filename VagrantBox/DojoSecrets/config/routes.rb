Rails.application.routes.draw do
  root 'sessions#new'
  get 'sessions/new' => 'sessions#new'
  post 'sessions/login' => 'sessions#login'
  get 'sessions/logout' => 'sessions#destroy'

  post 'users' => 'users#create'
  get 'users/list' => 'users#list'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  put 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  
  get 'secrets' => 'secrets#index'
  post 'secrets' => 'secrets#create'
  post 'secrets' => 'secrets#create'
  delete 'secrets/:id' => 'secrets#destroy'

  post 'likes' => 'likes#create'
  delete 'likes/:id' => 'likes#destroy'
end
