class SessionsController < ApplicationController
    def create
        user = User.from_omniauth(request.env['omniauth.auth']) #method created in the model, parameters comes from API
        cookies[:user_id] = user.id
        flash[:success] = "Hello, #{user.name}!"
        redirect_to root_url
    end
    
    def destroy
        cookies.delete(:user_id)
        flash[:success] = "Take Care! #NWTS"
        redirect_to root_url
    end
    
    def auth_fail
       render text: "You've tried to authenticate via #{params[:strategy]}, but the following error occurred: #{params[:message]}", status: 500 
    end
end
