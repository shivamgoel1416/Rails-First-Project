class Admin::CommentsController < Admin::ApplicationController
  
  def index
    if params[:Search]
      @comments = Comment.joins(:visitor).where("fullname LIKE ? OR message LIKE ?","%#{params[:Search]}%","%#{params[:Search]}%").page params[:page]
    else
      @comments = Comment.where(status: to_bool(params[:status])).page params[:page]
    end
  end

  def update
    @comment = Comment.find(params[:id])
      if @comment.update(status: params[:status])
        redirect_to :back, notice: "Comment's status changed successfully."
      else
        render 'index' 
        flash[:alert] = 'Problem in changing the status.'
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back, notice: "Comment Deleted Successfully."
  end

end
