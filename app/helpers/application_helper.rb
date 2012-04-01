module ApplicationHelper
  def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
  end




  def wrap_long_string(text, max_width = 15)
    zero_width_space = "&#8203;"
    regex = /.{1,#{max_width}}/
    (text.length < max_width) ? text :
        text.scan(regex).join(zero_width_space)

  end

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end

  def is_active?(page_name)
    "active" if params[:action] == page_name
  end








  def gopath(email)
    @as = root_path
    employee = Employee.find_by_email(email)
    trainer = Trainer.find_by_email(email)
    user = User.find_by_email(email)
    if user.admin? #is an Admin User
        return  users_dashboard_path
    elsif   !employee && user.temp.to_i == 0      #Has signed up but has not registered
     # @pre = "new_employee_path"
      return new_employee_path
       elsif employee           #Is an Employee
      return  employees_dashboard_path
    elsif !employee && !trainer
      return new_trainer_path
    elsif trainer           #is a Trainer   ## NOTE: Trainer would never fill the registration form themselves
         return trainers_dashboard_path
    end
    return user.temp
  end




end

