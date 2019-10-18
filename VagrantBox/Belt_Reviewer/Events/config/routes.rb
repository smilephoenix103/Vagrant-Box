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
  post 'events' => 'events#create'
  get 'events/:id' => 'events#show'
  get 'events/:id/edit' => 'events#edit'
  patch 'events/:id' => 'events#update'
  delete 'events/:id' => 'events#destroy'

  # JOIN ROUTES
  post 'joins/:id' => 'joins#create'
  delete 'joins/:id' => 'joins#destroy'

  # COMMENT ROUTES
  post 'comments/:id' => 'comments#create'
  
  get "*path" => redirect("/")

end
