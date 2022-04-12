Rails.application.routes.draw do
  root to: 'welcome#index', as: 'home'

  resources :news

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
