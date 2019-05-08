Rails.application.routes.draw do
  root 'static_pages#home'


  ## afterthoughts routes ##
  get '/afterthoughts/new/:event_id', to: 'afterthoughts#new'


  ## calendar routes ##
  get '/calendars/new/:user_id', to: 'calendars#new'
  post 'calendars', to: 'calendars#create'

  ##events routes##
  get "/events/new/:calendar_id/:year/:month/:day", to: 'events#new'

  ## signup, login, logout routes ##
  get    '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  ## resources ##
  resources :users, :events, :calendars, :afterthoughts
  resources :sessions, only: [:new, :create,:destroy]
end
