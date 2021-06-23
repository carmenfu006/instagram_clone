class PostsController < ApplicationController

  def create
    # logged_in user = current_user
    post = current_user.posts.create(post_params)
    if post.save
      redirect_to user_path(current_user), notice: 'Your post was successfully created.'
    else
      render user_path(current_user), alert: 'There was an error'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post
      post.update(post_params)
      redirect_to user_path(current_user), notice: 'Your post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user), notice: 'Your post was successfully deleted.'
  end

  private
    def post_params
      params.require(:post).permit(:caption, :post_photo)
    end
end
