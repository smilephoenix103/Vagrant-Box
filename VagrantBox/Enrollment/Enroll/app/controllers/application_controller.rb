class ApplicationController < ActionController::Base
    before_action :require_login

    def require_login
        flash[:messages] = ["User must be logged in"] unless session[:user_id]
        redirect_to '/' unless session[:user_id]
    end

    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

end
