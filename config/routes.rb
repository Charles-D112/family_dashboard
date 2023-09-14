Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :trophees
  resources :tutos
  resources :lists, only: %i[index show new create edit update destroy] do
    resources :tasks, only: %i[index show new edit update] do
      post "complete_task/:id", to: "tasks#complete_task", on: :member
    end
  end
  delete "tasks/:task_id", to: "tasks#destroy", as: :delete_task
  #resources :tasks, only: %i[destroy]

  resources :meetings

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
