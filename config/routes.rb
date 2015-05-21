Rails.application.routes.draw do
  #The default page for the app
  root 'comments#new'
  
  #creates CRUD for :comments, but ONLY new() and create() 
  resources :comments, only: [:new, :create, :destroy]
  
  #routes for session controller
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#auth_fail'
  get '/sign_out', to: 'sessions#destroy', as: :sign_out
  
end
