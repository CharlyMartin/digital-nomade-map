Rails.application.routes.draw do
  put 'api/update'

  # devise_for :nomads

  resources :nomads, only: %i(index new create edit update destroy)
  root to: 'pages#home'
end
