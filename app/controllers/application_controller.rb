class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_is_authenticated
  helper_method :require_logged_in 
  
    private
  
    def user_is_authenticated
      !!current_user
    end
      
    def current_user
      User.find_by(id: session[:user_id])
    end
  
    def require_logged_in
      unless user_is_authenticated
        flash[:errors] = "Please Log In to continue"
        redirect_to controller: 'sessions', action: 'new'
      end
    end 
end