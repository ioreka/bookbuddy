Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :followings
  resources :readings

  get '/', to: 'sessions#welcome', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  get '/signup', to: 'users#new', as: 'signup'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  get '/books/search_results', to: 'books#search_results', as: 'search_results'
  post '/books', to: 'books#search', as: 'search_book'
  delete '/unfollow', to: 'followings#destroy', as: "unfollow"
  resources :books, only: [:index, :show]
  post '/comments', to: 'comments#create', as: "comments"
  get '/wall', to: 'users#wall', as: 'user_wall'
end
