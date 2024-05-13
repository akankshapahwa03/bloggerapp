class Admin::DashboardController < Admin::BaseController
  layout 'admin/base'

  def index
    @user = User.all
  end
end