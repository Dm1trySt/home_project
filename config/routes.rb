Rails.application.routes.draw do
  devise_for :users
  get 'user/index'
  get 'user/new'
  get 'user/create'
  get 'user/edit'
  get 'user/update'
  get 'user/complete'
  get 'user/destroy'
  root to: 'welcome#index', as: 'home'

  resources :news

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
