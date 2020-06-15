Rails.application.routes.draw do

  root to: 'events#index'

  resources :users
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :events do
    post 'attend', on: :member
  end
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

end
