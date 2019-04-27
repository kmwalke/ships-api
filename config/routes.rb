Rails.application.routes.draw do
  resources :groups
  resources :satellites
  resources :users

  scope do
    post '/login' => 'sessions#create'
    post '/signup' => 'sessions#new_user'
    delete '/logout' => 'sessions#destroy'
  end
end
