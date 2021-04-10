Rails.application.routes.draw do

  root to: 'sessions#index'


  resources :complainants
  resources :crimes
  resources :dashboard, only: [:index]


  get '/', to: 'sessions#index'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  post '/users/:id/toggle_role', to: 'users#toggle_role', as: 'toggle_user_role'
  post '/users/:id/toggle_status', to: 'users#toggle_status', as: 'toggle_user_status'
  delete '/users/:id', to: 'users#destroy', as: 'destroy_user'

  resources :first_information_reports
  post '/first_information_reports/:id/approve', to: 'first_information_reports#approve', as: 'approve_fir'
  post '/first_information_reports/:id/reject', to: 'first_information_reports#reject', as: 'reject_fir'

  resources :categories
  post 'categories/:id/activate', to: 'categories#activate', as: 'activate_category'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
