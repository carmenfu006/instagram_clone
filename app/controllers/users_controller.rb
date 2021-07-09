class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.all

    @new_relationship = Relationship.new

    if current_user != nil
      @find_relationship = current_user.active_relationships.find_by(following_id: @user.id)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    if user.save
      redirect_to user_path(user), notice: 'Your profile was successfully updated'
    else
      render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :birth_date, :profile_picture)
    end
end
