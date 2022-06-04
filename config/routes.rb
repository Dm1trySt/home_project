Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index', as: 'home'
  get '/settings', to: 'settings#index'
  resources :news
  resources :users
  resources :projects do
    resources :issues, only: [:index, :new, :create]
  end
  resources :issues, except:  [:new, :create]  do
    resources :journals,  only: [:index, :new, :create]
  end
  resources :journals, except:  [:index, :new, :create]
end
