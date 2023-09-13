Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :trophees
  resources :tutos
  resources :lists, only: %i[index show new create edit update destroy] do
    resources :tasks, only: %i[index show new edit update]
  end
  post "tasks/complete_task", to: "tasks#complete_task", as: :complete_task
  delete "tasks/:task_id", to: "tasks#destroy", as: :delete_task
  #resources :tasks, only: %i[destroy]

  resources :tutos
  resources :meetings
  resources :trophees
end
