Rails.application.routes.draw do
  
  # SESSION
  root 'sessions#new'
  get 'sessions' => 'sessions#new'
  post 'sessions' => 'sessions#login'
  delete 'sessions' => 'sessions#logout'
  
  #USERS
  get 'users' => 'users#index'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  put 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  get "*path" => redirect('/')
end
