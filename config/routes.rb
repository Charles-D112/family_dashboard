Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :trophees
  resources :tutos
<<<<<<< HEAD
  resources :lists, only: %i[index show new create edit update destroy] do
=======
  resources :meetings
  resources :lists, only: %i[index show new create edit destroy] do
>>>>>>> master
    resources :tasks, only: %i[index show new edit update]
  end

  delete "tasks/:task_id", to: "tasks#destroy", as: :delete_task
  #resources :tasks, only: %i[destroy]

  resources :tutos
  resources :meetings
  resources :trophees
end
