Rails.application.routes.draw do
  devise_for :nomads, controllers: { omniauth_callbacks: 'nomads/omniauth_callbacks' }

  root to: 'pages#home'
  get 'nomads_around', to: 'pages#nomads_around', as: 'nomads_around'
  get 'misson', to: 'pages#mission', as: 'mission'
  get 'privacy', to: 'pages#privacy', as: 'privacy'

  resources :nomads, only: %i(index show edit update)


  put 'api/update'
end
