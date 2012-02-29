module SessionsHelper

  def current_user=(user)
    @current_user = user
  end

  def current_employee=(employee)
    @current_employee = employee
  end

  def current_employee?(employee)
   employee == current_user
  end

  def current_user?(user)
    user == current_user
  end


end
