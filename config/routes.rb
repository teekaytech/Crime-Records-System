Rails.application.routes.draw do
  get 'dashboard/index'
  resources :first_information_reports
  resources :complainants
  resources :crimes
  resources :categories
  devise_for :users
  root to: 'static#index'

  resources :static, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
