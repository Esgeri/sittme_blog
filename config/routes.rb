Rails.application.routes.draw do
  devise_for :users
  root 'pages#welcome'
  get 'about', to: 'pages#about'
  resources :articles
end
