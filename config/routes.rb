Rails.application.routes.draw do
  #Knock user token creator
  post '/user_token' => 'user_token#create'

  #User routes
  get '/users/current' => 'users#current'
  post '/create_user' => 'users#create'

  #Household routes
  get '/my_households' => 'households#my_households'
  get '/household/:id' => 'households#details'

end
