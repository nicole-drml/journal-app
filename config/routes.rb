Rails.application.routes.draw do

  get '/categories' => 'categories#index', as: 'categories'
  get '/categories/new' => 'categories#new', as: 'new_category'
  post '/categories/create' => 'categories#create', as: 'create_category'
  get '/category/:id' => 'category#show', as: 'category'
  get '/category/:id/edit' => 'category#edit', as: 'edit_category'
  patch '/category/:id' => 'category#update', as: 'update_category'
  delete '/category/:id' => 'category#delete', as: 'delete_category'

  get '/categories/:category_id/tasks(.:format)' => 'tasks#index', as: 'category_tasks'
  post '/categories/:category_id/tasks(.:format)' => 'tasks#create', as: 'create_category_task'
  get '/categories/:category_id/tasks/new(.:format)' => 'tasks#new', as: 'new_category_tasks'
  get '/categories/:category_id/tasks/:id/edit(.:format)' => 'tasks#edit', as: 'edit_category_task'
  get '/categories/:category_id/tasks/:id(.:format)' => 'tasks#show', as: 'category_task'
  patch '/categories/:category_id/tasks/:id' => 'task#update', as: 'update_task'
  delete '/categories/:category_id/tasks/:id' => 'task#delete', as: 'delete_task'




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
