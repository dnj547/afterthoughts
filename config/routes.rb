Rails.application.routes.draw do
  root 'application#welcome'

  # get 'users/signup', to: 'users#new', as: 'signup'

  resources :users, :afterthoughts
  resources :events
  resources :sessions, only: [:new,:create,:destroy]

  get "/events/new/:calendar_id/:year/:month/:day", to: 'events#new'

  ## signup/login/logout routes ##
  get 'signup', to:'users#new', as:'signup'
  get 'login', to: 'sessions#new', as:'login'
  get 'logout', to:'sessions#destroy', as: 'logout'


end
