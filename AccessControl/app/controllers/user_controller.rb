class UserController < ApplicationController
  layout 'userspage'

  def index
    @user = User.where(id: session[:current_user_id])
    if @user[0].role_id == 1
      @user = User.where('role_id != ?',1)
      @link_flag = true
    else
      @link_flag = false
      @user    
    end
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_index_url, notice:  "Successfully updated."
      else
        flash[:alert] = "Problem in updating the role."
        render 'edit'
      end
  end

  private

  def user_params
    params.require(:user).permit(:role_id)
  end
end