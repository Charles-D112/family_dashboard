Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  resources :lists, only: %i[index show new create edit destroy] do
    resources :tasks, only: %i[index show new edit update]
  end

  resources :tasks, only: %i[create destroy]
  resources :tutos
  resources :meetings, only: %i[index show]
  resources :trophees
end
