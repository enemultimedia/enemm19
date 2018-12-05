Rails.application.routes.draw do
  resources :talk_suggestions, only: :create
  get 'index', to: 'pages#index', as: 'index'
  get 'about', to: 'pages#about', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
end
