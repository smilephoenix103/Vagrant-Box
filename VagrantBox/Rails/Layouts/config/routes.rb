Rails.application.routes.draw do
  root 'users#index'
  get 'posts' => 'posts#index'
  post 'posts' => 'posts#create'
  get 'users' => 'users#index'
  post 'users' => 'users#create'
end
