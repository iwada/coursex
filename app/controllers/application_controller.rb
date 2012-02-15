class ApplicationController < ActionController::Base
  protect_from_forgery

  include PagesHelper
  include ApplicationHelper
  #before_filter :require_login



  #def not_authenticated
  #redirect_to root_path, :alert => "Please login first."
  #end

end
