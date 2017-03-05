class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :login
  
  def current_user
    @user ||= User.find(session[:current_user_id][0]) if session[:current_user_id]
  end

  def login
    if !current_user
      redirect_to '/login', alert: 'Please login first.'
    end
  end
end
