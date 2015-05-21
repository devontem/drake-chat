class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #Defines the current user of the website, sets it to the cookies[:user_id] (if exists)
  def current_user
    @current_user ||= User.find_by(id: cookies[:user_id]) if cookies[:user_id]
  end
   
   #This makes the defined methods available in the view
  helper_method :current_user
end
