Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
  root to: 'task_lists#index'
  
  resources :task_lists
  resources :users, only: [:show, :new, :create, :destroy]
end
