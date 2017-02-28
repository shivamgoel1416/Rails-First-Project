class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  require 'wannabe_bool'
  layout 'admin'

  def current_moderator
    @moderator ||= Moderator.find(session[:current_moderator_id]) if session[:current_moderator_id]
  end

  def authorize
    unless current_moderator
      redirect_to '/login', alert: 'Please login to view admin pages.'
    end
  end

  def to_bool string
    string.to_b
  end

end