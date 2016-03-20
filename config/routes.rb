Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  resources :users do
    resources :locations
    resources :trips do
      member do
        post 'copy_to_same_day'
        post 'copy_to_next_working_day'
        post 'copy_to_today'
      end
    end
    resources :routes
  end
end
