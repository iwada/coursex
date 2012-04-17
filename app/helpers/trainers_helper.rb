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

end
