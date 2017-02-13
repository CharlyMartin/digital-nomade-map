Rails.application.routes.draw do
  put 'api/update'

  root to: 'pages#home'
  get 'nomads_around', to: 'pages#nomads_around', as: 'nomads_around'
  get 'misson', to: 'pages#mission', as: 'mission'

  devise_for :nomads

  resources :nomads, only: %i(index new create edit update destroy)
end
