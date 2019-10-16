Rails.application.routes.draw do
  # SESSIONS ROUTES
  root 'sessions#new'
  get 'sessions/new' => 'sessions#new'
  post 'sessions' => 'sessions#login'
  delete 'sessions' => 'sessions#logout'

  # USERS ROUTES
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  # EVENTS ROUTES
  get 'events' => 'events#index'
  get 'events/:id' => 'events#show'
  post 'events' => 'events#create'
  delete 'events/:id' => 'events#destroy'
end
