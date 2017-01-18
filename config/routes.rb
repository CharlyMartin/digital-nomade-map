Rails.application.routes.draw do
  put 'api/update'

  root to: 'pages#home'
  get 'nomad_around', to: 'pages#nomad_around', as: "nomad_around"

  devise_for :nomads

  resources :nomads, only: %i(index new create edit update destroy)
end
