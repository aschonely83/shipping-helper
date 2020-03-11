class ApplicationController < ActionController::Base
  helper_method :verified_user
  helper_method :current_user
  helper_method :user_is_authenticated
  helper_method :require_logged_in 
  
    private
  
    def verified_user
      redirect_to '/' unless user_is_authenticated 
    end
  
    def user_is_authenticated
      !!current_user
    end
      
    def current_user
     current_user =  User.find_by(id: session[:user_id])
    end
  
    def require_logged_in
      redirect_to controller: 'sessions', actions: 'new', alert: "Please log in" unless user_is_authenticated
    end 
end