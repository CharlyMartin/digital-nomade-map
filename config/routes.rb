Rails.application.routes.draw do
  put 'api/update'
  devise_for :nomads, controllers: { omniauth_callbacks: 'nomads/omniauth_callbacks' }

  scope '(:locale)', locale: /en|fr/ do
    root to: 'pages#home'

    get 'nomads_around', to: 'pages#nomads_around', as: 'nomads_around'
    get 'misson', to: 'pages#mission', as: 'mission'
    get 'about', to: 'pages#about', as: "about"
    get 'privacy', to: 'pages#privacy', as: 'privacy'

    resources :nomads, only: %i(index show update)
    get 'nomads/:id/edit', to: 'nomads#edit', as: 'edit'
    # get 'nomads/:id/edit_location', to: 'nomads#edit_location', as: 'edit_location'
  end
end
