Rails.application.routes.draw do
  resources :groups
  resources :satellites
  resources :users

  get '/config' => 'config#index'

  scope do
    post '/login' => 'sessions#create'
    post '/signup' => 'sessions#new_user'
    delete '/logout' => 'sessions#destroy'
  end
end
