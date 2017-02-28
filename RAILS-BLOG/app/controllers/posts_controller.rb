class PostsController < ApplicationController
  after_filter :clear_sessions, only: [:show]
  def index
    if params[:tag]
      @posts = Post.filter_by_tags(params[:tag]).page(params[:page]).per(Setting.first.posts_per_page)
    else
      @posts = Post.published.order(id: :desc).page(params[:page]).per(Setting.first.posts_per_page)
    end
  end

  def show
    @post = Post.find(params[:id])
    @visitor_comment = visitor_comment
  end

  def clear_sessions
    [:visitor_errors].each { |k| session.delete(k) }
  end

  def visitor_comment
    if session[:visitor_errors]
      VisitorCommentService.new(session[:visitor_params]).visitor
    else
      Visitor.new(comments: [Comment.new])
    end
  end
end