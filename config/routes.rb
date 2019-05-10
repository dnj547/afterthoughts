Rails.application.routes.draw do
  root 'static_pages#home'

  ## analytics routes ##
  get 'analytics', to: 'users#analytics'

  ##events routes##
  post "/events", to: 'events#create'
  get "/events", to: 'events#show'
  get "/events/new/:calendar_id/:year/:month/:day", to: 'events#new'
  get "/events/new_auto/:calendar_id/", to: 'events#new_auto'

  get "/events/:id/event_afterthought", to: 'events#event_afterthought'


  ## attendee routes ##
  post '/attendees', to:'attendees#create'
  get '/events/attendees/new/:id', to: 'attendees#new'
  get '/afterthoughts/attendees/new/:id', to: 'attendees#actual_new'
  post '/afterthoughts/attendees/new/:id', to: 'attendees#actual_create'

  ## afterthoughts routes ##
  get '/afterthoughts/new/:event_id', to: 'afterthoughts#new'
  get "/afterthoughts/new_auto/:calendar_id/", to: 'afterthoughts#new_auto'

  ## calendar routes ##
  get '/calendars/new/:user_id', to: 'calendars#new'
  post 'calendars', to: 'calendars#create'

  ## signup, login, logout routes ##
  get    '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  ## users routes ##

  ## resources ##
  resources :users, :events, :calendars, :afterthoughts, :attendees
  resources :sessions, only: [:new, :create,:destroy]

  # get '*path' => redirect('/')


end
