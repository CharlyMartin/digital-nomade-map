Rails.application.routes.draw do
  resources :nomads, only: %i(new create destroy)
  root to: 'nomads#index'
end
