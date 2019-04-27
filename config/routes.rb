Rails.application.routes.draw do
  resources :satellites

  scope format: true, constraints: { format: 'json' } do
    post '/login' => 'sessions#create'
    post '/signup' => 'sessions#new_user'
    delete '/logout' => 'sessions#destroy'
  end
end
