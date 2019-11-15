class ApplicationController < ActionController::Base
    before_action :require_login

    def require_login
        flash[:messages] = ["User must be logged in"] unless session[:user_id]
        redirect_to '/' unless session[:user_id]
    end

    def current_user
        if session[:admin] == false
            Student.find(session[:user_id])
        else
            Instructor.find(session[:user_id]) 
        end
    end

    helper_method :current_user
end
