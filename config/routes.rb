Rails.application.routes.draw do
  # devise_for :nomads

  resources :nomads, only: %i(new create edit update destroy)
  root to: 'nomads#index'
end
