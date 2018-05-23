Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  get 'scoreboard', to: 'scoreboard#index'
  get 'trips', to: 'trips#recent'

  get '/.well-known/acme-challenge/:id' => 'welcome#letsencrypt'


  resources :users do
    member do
      get 'progress', to: 'progress#index'
    end
    resources :locations
    resources :trips do
      collection do
        post 'create_from_route'
      end
      member do
        post 'copy_to_same_day'
        post 'copy_to_next_working_day'
        post 'copy_to_today'
      end
    end
    resources :routes
  end

  namespace 'hr' do
    resources :users, only: [:index, :edit, :update]
    resources :reports, only: [:new, :create]
  end
end
