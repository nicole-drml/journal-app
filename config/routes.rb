Rails.application.routes.draw do
  root 'home#index' 

  get '/registrations' => 'registrations#index', as: 'registrations'
  post '/registrations' => 'registrations#create', as: 'create_registration'
  get '/registrations/new' => 'registrations#new', as: 'new_registration'

  post '/sign_in' => 'sessions#create', as: 'create_sign_in'
  get '/sign_in' => 'sessions#new', as: 'new_sign_in'
  delete '/logout' => 'sessions#destroy'

  get '/categories' => 'categories#index', as: 'categories'
  post '/categories' => 'categories#create', as: 'create_category'
  get '/categories/new' => 'categories#new', as: 'new_category'
  get '/categories/:id/edit' => 'categories#edit', as: 'edit_category'
  get '/categories/:id' => 'categories#show', as: 'category'
  patch '/categories/:id' => 'categories#update', as: 'update_category'
  put '/categories/:id' => 'categories#update'
  delete '/categories/:id' => 'categories#destroy', as: 'delete_category'

  get '/categories/:category_id/tasks' => 'tasks#index', as: 'tasks'
  post '/categories/:category_id/tasks' => 'tasks#create', as: 'create_task'
  get '/categories/:category_id/tasks/new' => 'tasks#new', as: 'new_task'
  get '/tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  get 'tasks/:id' => 'tasks#show', as: 'task'
  patch '/tasks/:id' => 'tasks#update', as: 'update_task'
  put '/tasks/:id' => 'task#update'
  delete '/tasks/:id' => 'task#destroy', as: 'delete_task'




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
