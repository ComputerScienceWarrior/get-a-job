class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :is_logged_in?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def is_logged_in?
        !session[:user_id].nil?
    end
end
