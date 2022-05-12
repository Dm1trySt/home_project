Rails.application.routes.draw do
  root to: 'welcome#index', as: 'home'
  resources :news
end
