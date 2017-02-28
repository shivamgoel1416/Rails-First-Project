class Admin::PostsController < Admin::ApplicationController
  
  def index
    if params[:Search].present?
      @posts = Post.where("title LIKE ? OR content LIKE ?", "%#{params[:Search]}%","%#{params[:Search]}%").page params[:page]
    else
      @posts = Post.all.order(id: :desc).page params[:page]
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post  = Post.new(post_params)
    @post.moderator_id = current_moderator.id
    if @post.save
      redirect_to admin_posts_url, notice: "Post Created successfully."
    else
      flash[:alert] = "Problem creating new post."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_posts_url, notice: "Post updated successfully."
    else
      flash[:alert] = "Problem in updating post."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to :back, notice:  "Post deleted successfully."
    end
  end

  private

  def post_params
    params.require(:post).permit(:id,:title,:content,:publish,tag_ids: [])
  end
end
