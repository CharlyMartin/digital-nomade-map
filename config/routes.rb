Rails.application.routes.draw do
  put 'api/update'

  root to: 'pages#home'

  devise_for :nomads

  resources :nomads, only: %i(index new create edit update destroy)
end
