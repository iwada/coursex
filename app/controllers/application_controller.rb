class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login, :instantiate_controller_and_action_names

  include PagesHelper
  include ApplicationHelper
  include CoursesHelper
  include EmployeesHelper
  include AccesspinsHelper
  include TrainersHelper



  protected
  def not_authenticated
    redirect_to login_path, :alert => "Please login to Access that Page."
  end



  private
  def instantiate_controller_and_action_names
    @current_action = action_name
    @current_controller = controller_name
  end

  private
  #def authorize_admin!
  #  logged_in?
  #  unless current_user.admin?
  #   redirect_to root_path, :notice => "Please You do not have the Access Right for this page"
  #  end
  #  end

end
