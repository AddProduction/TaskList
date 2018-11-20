Rails.application.routes.draw do
  root 'toppages#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :task_lists, only: [:index, :show, :create, :update, :destroy]

  resources :users, only: [:show, :new, :create, :destroy]
end
