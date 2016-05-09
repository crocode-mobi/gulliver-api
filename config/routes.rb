Rails.application.routes.draw do
  root 'uptimes#index'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      # Validations
      get 'validate', to: 'validations#index'

      # Sessions ---------------------------
      post 'login',    to: 'sessions#login'
      post 'register', to: 'sessions#register'
      post 'logout',   to: 'sessions#logout'
      resources :account, only: [:destroy]

      # post 'facebook/login', to: 'facebook#login'
      # post 'facebook/register', to: 'facebook#register'
      # post 'twitter/login', to: 'twitter#login'
      # post 'twitter/register', to: 'twitter#register'

      # Cities
      get 'locations', to: 'locations#index'

      # Users related information ----------
      post 'activities', to: 'activities#create'

      get  'me',              to: 'profile#me'
      get  'me/hydratations', to: 'hydratations#index'
      post 'me/hydratations', to: 'hydratations#create'
      get  'me/meals',        to: 'meals#index'
      post 'me/meals',        to: 'meals#create'
      get  'profile',         to: 'profile#show'
      post 'profile',         to: 'profile#update' # iOS Fix
      put  'profile',         to: 'profile#update'

      resources :users, only: [:show] do
        member do
          get :badges
        end
      end

      # Stages
      resources :stages, only: [:index, :show]
      post 'races/start',     to: 'races#start'
      get  'races/status',    to: 'races#status'

      # Badges -----------------------------
      resources :badges, only: [:index, :show]

      # Ranking ----------------------------
      resources :ranking, only: [:index]

      # Tips -------------------------------
      resources :tips, only: [:index] do
        collection do
          get :meal
          get :hydratation
          get :running
          get :other
        end
        member do
          post :share
        end
      end
    end
  end

  match "*path", to: "routing#index", via: :all

end
