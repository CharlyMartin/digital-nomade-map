Rails.application.routes.draw do
  devise_for :nomads, controllers: { omniauth_callbacks: 'nomads/omniauth_callbacks' }

  root to: 'pages#home'
  get 'nomads_around', to: 'pages#nomads_around', as: 'nomads_around'
  get 'about', to: 'pages#mission', as: 'about'
  get 'privacy', to: 'pages#privacy', as: 'privacy'

  resources :nomads, only: %i(index show edit update)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :nomads, only: %i(index show update)
    end
  end
end
