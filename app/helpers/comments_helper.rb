module CommentsHelper
  def already_liked?(comment)
    return false unless current_user
    comment.likes.where(user_id: current_user.id).exists?
  end
end