class Admin::ModeratorsController < Admin::ApplicationController
  def index
    @moderators = Moderator.all 
  end 

  def edit
    @moderator = Moderator.find(params[:id])
  end

  def update
    @moderator = Moderator.find(params[:id])
      if @moderator.update(moderator_params)
        flash[:notice] = "Successfully created..."
        redirect_to admin_moderators_url
      else
        flash[:alert] = "Unsuccessful operation..."
        render('edit')
      end
  end

  private
    def moderator_params
      params.require(:moderator).permit(:id,:fullname,:username,:password)
    end
    
end