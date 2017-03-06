class SessionsController < ApplicationController
  
  before_action :login, except: [:new,:create]
  
  def new
    redirect_to user_index_url if current_user
  end

  def create
    @user = User.find_by(:username => params[:username]).try(:authenticate,params[:password])    
    if @user
      # role = Role.find_by(:id => @user.id)
      # webpage_name = Page.find_by(:role_id => role.id)
      session[:current_user_id] = @user.id
      redirect_to user_index_path(session[:current_user_id])
    else
      flash[:alert] = "Problem while signing in."
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to '/login', notice: "You have logged out successfully."
  end
end
