Rails.application.routes.draw do
  root 'static_pages#home'

  ## analytics routes ##
  get 'analytics', to: 'users#analytics'

  ## attendee routes ##
  post '/attendees', to:'attendees#create'

  ## afterthoughts routes ##
  get '/afterthoughts/new/:event_id', to: 'afterthoughts#new'

  ## calendar routes ##
  get '/calendars/new/:user_id', to: 'calendars#new'
  post 'calendars', to: 'calendars#create'

  ##events routes##
  post "/events", to: 'events#create'
  get "/events/new/:calendar_id/:year/:month/:day", to: 'events#new'


  ## signup, login, logout routes ##
  get    '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  ## resources ##
  resources :users, :events, :calendars, :afterthoughts, :attendees
  resources :sessions, only: [:new, :create,:destroy]
end
