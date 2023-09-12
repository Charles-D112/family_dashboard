Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :lists, only: %i[index show new create edit destroy] do
    resources :tasks, only: %i[index show new edit update]
  end

  delete "tasks/:task_name", to: "tasks#destroy", as: :delete_task

  resources :tutos
  resources :meetings, only: %i[index show]
  resources :trophees
end
