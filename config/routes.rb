Rails.application.routes.draw do
  root 'application#welcome'
  resources :users, :events, :calendars
  resources :sessions, only: [:new, :create,:destroy]


  get '/calendars/new/:user_id', to: 'calendars#new'
  post 'calendars', to: 'calendars#create'

  get 'signup', to:'users#new', as:'signup'
  get 'login', to: 'sessions#create', as:'login'
  get 'logout', to:'sessions#destroy', as: 'logout'
end
