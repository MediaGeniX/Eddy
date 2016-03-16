Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  resources :users do
    resources :locations
    resources :trips
    resources :routes
  end
end
