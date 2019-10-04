Rails.application.routes.draw do
  root 'displays#index'
  get 'hello' => 'displays#hello'
  get 'say/hello(/:name)' => 'displays#say'
  get 'times' => 'displays#times'
  get 'times/restart' => 'displays#restart'
end
