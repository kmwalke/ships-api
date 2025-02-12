Rails.application.routes.draw do
  root to: 'home#index'
  # mount Sidekiq::Web => '/sidekiq' if Rails.env.development?

  resources :satellites
end
