Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/signup', to: 'users#signup' 
  #Create a UsersController with a signup method that responds to a POST /signup route 
  get '/user_logged_in', to: 'users#user_logged_in'

  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'

end
