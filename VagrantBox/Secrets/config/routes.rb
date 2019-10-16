Rails.application.routes.draw do
  # SESSION ROUTES
  root 'sessions#new'
  get 'sessions/new' => 'sessions#new'
  post 'sessions/new' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'

  # USER ROUTES
  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  # SECRET ROUTES
  get 'secrets' => 'secrets#index'
  post 'secrets' => 'secrets#create'
  delete 'secrets/:id' => 'secrets#destroy'

  #LIKE ROUTES
  post 'likes/:id' => 'likes#create'
  delete 'likes/:id' => 'likes#destroy'
end
