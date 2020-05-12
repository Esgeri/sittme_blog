Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'pages#welcome'
  get 'about', to: 'pages#about'
  get 'json_data', to: 'pages#json_data'
  resources :articles
  resources :profiles, only: [:index, :show]
end
