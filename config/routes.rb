Rails.application.routes.draw do
  root 'application#welcome'


  ## calendar routes ##
  get '/calendars/new/:user_id', to: 'calendars#new'
  post 'calendars', to: 'calendars#create'

  ##events routes##
  get "/events/new/:calendar_id/:year/:month/:day", to: 'events#new'

  ## signup, login, logout routes ##
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  ## resources ##
  resources :users, :events, :calendars, :afterthoughts
  resources :sessions, only: [:new, :create,:destroy]
end
