Rails.application.routes.draw do

  root to: 'sessions#index'

  # resources :first_information_reports
  # resources :complainants
  # resources :crimes
  # resources :categories
  resources :users
  resources :dashboard, only: [:index]


  get '/', to: 'sessions#index'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  post '/users/:id/toggle_role', to: 'users#toggle_role', as: 'toggle_user_role'
  post '/users/:id/toggle_status', to: 'users#toggle_status', as: 'toggle_user_status'
  delete '/users/:id', to: 'users#destroy', as: 'destroy_user'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
