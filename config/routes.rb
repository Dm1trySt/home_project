Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index', as: 'home'
  resources :news
end
