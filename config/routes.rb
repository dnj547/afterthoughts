Rails.application.routes.draw do
  root 'application#welcome'
  resources :users, :events, :calendars, :afterthoughts
  resources :sessions, only: [:new, :create,:destroy]

  get '/calendars/new/:user_id', to: 'calendars#new'
  post 'calendars', to: 'calendars#create'
  get "/events/new/:calendar_id/:year/:month/:day", to: 'events#new'
  get 'signup', to:'users#new', as:'signup'
  get 'login', to: 'sessions#create', as:'login'
  get 'logout', to:'sessions#destroy', as: 'logout'

end
