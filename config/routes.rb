Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :task_lists

  resources :users, only: [:show, :new, :create, :destroy]
end
