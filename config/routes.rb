Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :events
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
