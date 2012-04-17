module EmployeesHelper
  def current_employee
  return Employee.find_by_email(current_user.email)

  end

  def current_employee?(employee)
    employee == Employee.find_by_email(current_user.email)
  end

  def phrase(id)
     @present = Progress.find_by_course_id(id)
    if @present
      return "Deregister"
    end
    return "Register"
  end

end
