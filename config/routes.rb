Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'pages#welcome'
  get 'about', to: 'pages#about'
  resources :articles
  resources :profiles, only: [:index, :show]
end
