Rails.application.routes.draw do
  root 'home#index' 

  get '/registrations' => 'registrations#index', as: 'registrations'
  post '/registrations' => 'registrations#create', as: 'create_registration'
  get '/registrations/new' => 'registrations#new'

  get '/categories' => 'categories#index', as: 'categories'
  get '/categories/new' => 'categories#new', as: 'new_category'
  post '/categories' => 'categories#create', as: 'create_category'
  get '/categories/:id' => 'categories#show', as: 'category'
  get '/categories/:id/edit' => 'categories#edit', as: 'edit_category'
  patch '/categories/:id' => 'categories#update', as: 'update_category'
  delete '/categories/:id' => 'categories#delete', as: 'delete_category'

  get '/categories/:id' => 'tasks#index', as: 'category_tasks'
  get '/categories/:id/task_new(.:format)' => 'tasks#new', as: 'new_category_task'
  post '/categories/:id' => 'tasks#create', as: 'create_category_task'
  get '/categories/:id/task/:id(.:format)' => 'tasks#show', as: 'category_task'
  get '/categories/:id/task/:id/edit(.:format)' => 'tasks#edit', as: 'edit_category_task'
  patch '/categories/:id' => 'task#update', as: 'update_task'
  delete '/categories/:id/new_task/:id' => 'task#delete', as: 'delete_task'




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
