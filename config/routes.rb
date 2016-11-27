Rails.application.routes.draw do
  devise_for :nomads

  resources :nomads, only: %i(new create destroy)
  root to: 'nomads#index'
end
