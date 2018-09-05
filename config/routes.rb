Rails.application.routes.draw do
  get 'users/show'

  get 'assessment/index'

  get 'assessment/create'

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  
  root to: 'toppages#index'
  
  resources :users, only: [:show]
  resources :assessment, only: [:index, :create]
  
end
