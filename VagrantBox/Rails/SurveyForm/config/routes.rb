Rails.application.routes.draw do
  root 'forms#index'
  get 'results' => 'forms#results'
  post 'surveys' => 'forms#surveys'
end
