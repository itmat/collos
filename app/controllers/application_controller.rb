class ApplicationController < ActionController::Base
    before_filter :require_login
    protect_from_forgery
    helper_method :current_user

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
        unless current_user
            flash[:error] = "You must be logged in to access this section"
            redirect_to login_url # halts request cycle
        end
    end

end
