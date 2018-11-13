Rails.application.routes.draw do
  root to: 'task_lists#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'tasklists/:id/new' => 'tasklists#new'

  resources :users, only: [:show, :new, :create, :destroy]
end
