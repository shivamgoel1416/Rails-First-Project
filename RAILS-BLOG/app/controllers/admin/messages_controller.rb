class Admin::MessagesController < Admin::ApplicationController
  def index
    if params[:Search]
      @messages = Message.joins(:visitor).where("fullname LIKE ? OR content LIKE ?","%#{params[:Search]}%","%#{params[:Search]}%").page params[:page]
    else
      @messages = Message.all.order(id: :desc).page params[:page]
    end
  end

  def show
    @message = Message.find(params[:id])
    @message.mark_read
  end

  def update
    @message = Message.find(params[:id])
     if @message.update(status: params[:status])
      redirect_to :back, notice: 'Message status has been changed.'
     else
      render 'index'
      flash[:alert] = "Problem in changing the status."
     end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to :back, notice: 'Message deleted successfully.'
  end
end
