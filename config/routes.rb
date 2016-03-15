Rails.application.routes.draw do
  get 'routes/index'

  get 'routes/create'

  get 'routes/edit'

  get 'routes/update'

  get 'routes/destroy'

  root 'welcome#index'

  devise_for :users

  resources :users do
    resources :locations
    resources :routes
  end
end
