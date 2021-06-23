class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params.merge(user_id: current_user.id))

    if comment.save
      # mailer
      CommentMailer.new_comment_notification(comment).deliver_now
      redirect_to post_path(post), notice: 'Comment was successfully created.'
    else
      redirect_to post_path(post), alert: 'There was an error.'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
