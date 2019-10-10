Rails.application.routes.draw do
  get 'messages/index'
  get 'users/new'
  root 'users#new'
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'messages' => 'messages#index'
  post 'messages' => 'messages#create'
  post 'messages/:id' => 'messages#comment'
  get 'logout' => 'users#logout'
end
