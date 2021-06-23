class CommentMailer < ApplicationMailer
  def new_comment_notification(comment)
    @comment = comment
    @user = comment.post.user

    mail(to: @user.email, subject: "New comment from #{@comment.user.username}")
  end
end
