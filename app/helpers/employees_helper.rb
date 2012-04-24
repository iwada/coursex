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

  def level1employees
    @level1 = Employee.find_all_by_level(1).count
  end

  def level2employees
    @level1 = Employee.find_all_by_level(2).count
  end

  def level3employees
    @level1 = Employee.find_all_by_level(2).count
  end


end
