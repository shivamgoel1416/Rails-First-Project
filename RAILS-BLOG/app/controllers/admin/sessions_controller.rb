class Admin::SessionsController < Admin::ApplicationController

  before_action :authorize, except: [:new, :create]

  def new
    redirect_to admin_dashboard_index_url if current_moderator
  end

  def create
    @moderator = Moderator.find_by(:username => params[:username]).try(:authenticate,params[:password])
    if @moderator
      session[:current_moderator_id] = @moderator.id
      redirect_to admin_moderators_url, notice: "You have successfully signed In."
    else
      flash[:alert] = "There was a problem in your login."
      render :new
    end
  end

  def destroy
    session[:current_moderator_id] = nil
    redirect_to '/login', notice: "You have logged out successfully."
  end

end
