module ApplicationHelper
  def already_liked?(likeable)
    likeable.likes.where(user_id: current_user.id).exists?
  end
end