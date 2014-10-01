Lab6::Application.routes.draw do

  get "sessions/index"
  root 'films#index'

  get "search/by_film"
  get "search/by_cinema"
  get "search/by_film"

  resources :films

  resources :cinemas

  resources :sessions
end
