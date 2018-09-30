Rails.application.routes.draw do
  get 'requestedassessment/create'

  root to: 'toppages#index'

  devise_for :users, controllers: { 
    :omniauth_callbacks => "omniauth_callbacks",
    :sessions => 'users/sessions'
  }
  
  resources :users do
    member do
      get :requestassessment
    end
  end
  
  resources :assessment, only: [:index, :create, :about]

  get 'assessment/index'
  get 'assessment/about'

  resources :requestedassessment, only: [:create]
  
  post 'requestedassessment/create'
  
end
