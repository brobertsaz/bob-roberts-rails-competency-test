Rails.application.routes.draw do
  get 'pages/home'
  resources :articles
  devise_for :users

  authenticated :user do
    root 'articles#index', as: :authenticated_root
  end

  root 'pages#home'
end
