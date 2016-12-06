Rails.application.routes.draw do
  put 'api/update'

  # devise_for :nomads

  resources :nomads, only: %i(new create edit update destroy)
  root to: 'nomads#index'
end
