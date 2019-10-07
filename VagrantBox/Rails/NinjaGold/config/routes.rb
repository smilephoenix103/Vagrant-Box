Rails.application.routes.draw do
  root 'rpg#index'
  get '/farm' => 'rpg#farm'
  get '/cave' => 'rpg#cave'
  get '/house' => 'rpg#house'
  get '/casino' => 'rpg#casino'
  get '/reset' => 'rpg#reset'
end
