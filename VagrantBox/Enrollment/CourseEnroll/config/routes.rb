Rails.application.routes.draw do
  #SESSIONS
  root 'sessions#students'
  get 'sessions/students' => 'sessions#students'
  post 'sessions/students' => 'sessions#slogin'
  get 'sessions/instructors' => 'sessions#instructors'
  post 'sessions/instructors' => 'sessions#ilogin'
  delete 'sessions' => 'sessions#logout'

  #STUDENTS
  get 'students' => 'students#index'
  post 'students' => 'students#create'
  get 'students/:id' => 'students#show'
  get 'students/:id/edit' => 'students#edit'
  put 'students/:id' => 'students#update'
  delete 'students/:id' => 'students#destroy'

  #INSTRUCTORS
  get 'instructors' => 'instructors#index'
  post 'instructors' => 'instructors#create'
  get 'instructors/:id' => 'instructors#show'
  get 'instructors/:id/edit' => 'instructors#edit'
  put 'instructors/:id' => 'instructors#update'
  delete 'instructors/:id' => 'instructors#destroy'

  #COURSES
  get 'courses' => 'courses#index'
  get 'courses/new' => 'courses#new'
  post 'courses' => 'courses#create'
  get 'courses/:id' => 'courses#show'
  get 'courses/:id/edit' => 'courses#edit'
  put 'courses/:id' => 'courses#update'
  delete 'courses/:id' => 'courses#destroy'

  #ENROLLS
  get 'enrolls/:cid/:sid' => 'enrolls#create'
  delete 'enrolls/:cid/:sid' => 'enrolls#destroy'

  #CATCH ALL OTHERS
  get "*path" => redirect('/')

end
