Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books

  get '/', to: 'sessions#welcome', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  get '/signup', to: 'users#new', as: 'signup'
  post '/logout', to: 'sessions#destroy', as: 'logout'

end
