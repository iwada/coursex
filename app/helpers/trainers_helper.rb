module TrainersHelper

  def handledcourses
 return  @courseshandled = Trainer.find_by_email(current_user.email).handle
  end

  def current_trainer
    return Trainer.find_by_email(current_user.email)

  end

  def students

  end



  def current_trainer?(trainer)
    trainer == Trainer.find_by_email(current_user.email)
  end

  def level1trainers
    @level1 = Employee.find_all_by_level(1).count
  end

  def level2trainers
    @level1 = Employee.find_all_by_level(2).count
  end

  def level3trainers
    @level1 = Employee.find_all_by_level(2).count
  end

end
