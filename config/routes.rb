Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :tasks
  root to: 'tasks#index'

  patch 'todos/:id', to:'todos#update', as:'todo_update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
