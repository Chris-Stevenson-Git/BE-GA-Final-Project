Rails.application.routes.draw do
  #Knock user token creator
  post 'user_token' => 'user_token#create'


end
