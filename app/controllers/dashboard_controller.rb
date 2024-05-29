
  class DashboardController  < ApplicationController
  before_action :check_if_admin
   
  def index
    @user = User.all
  end

  private

  def check_if_admin
   unless current_user.admin?
     redirect_to root_path 
     flash[:alert] = "Unauthorized access! You need to be an admin to access the dashboard."
   end
  end
end
