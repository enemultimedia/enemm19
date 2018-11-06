Rails.application.routes.draw do
  devise_for :users
  resources :talk_suggestions, only: :create
  get 'index', to: 'pages#index', as: 'index'
  get 'about', to: 'pages#about', as: 'about'
  get 'speakers', to: 'pages#speakers', as: 'speakers'
  get 'speakers/:slug', to: 'pages#speakers', as: 'speaker'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
end
