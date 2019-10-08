class PostsController < ApplicationController
    layout "three_column"

    def index
    @users = User.all
    @posts = Post.all
  end

  def create
    post = Post.create(post_params)
    if post.errors.any?
      flash[:errors] = post.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "New post Created"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
