Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root 'dynamic#index'

  match '/signup',    to: 'users#new',              via: 'get'
  match '/signin',    to: 'sessions#new',           via: 'get'
  match '/signout',   to: 'sessions#destroy',       via: 'delete'
  match '/search',    to: 'dynamic#search',         via: 'get'
end
