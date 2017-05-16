Rails.application.routes.draw do
  put 'api/update'
  devise_for :nomads

  scope '(:locale)', locale: /en|fr/ do
    root to: 'pages#home'

    get 'nomads_around', to: 'pages#nomads_around', as: 'nomads_around'
    get 'misson', to: 'pages#mission', as: 'mission'
    get 'about', to: 'pages#about', as: "about"

    resources :nomads, only: %i(index show update)
    get 'nomads/:id/edit_info', to: 'nomads#edit_info', as: 'edit_info'
    get 'nomads/:id/edit_location', to: 'nomads#edit_location', as: 'edit_location'
  end
end
