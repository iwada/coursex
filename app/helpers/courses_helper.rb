module CoursesHelper

  def lastthree
    @lastthree = Course.last.name
  end

  def level1courses
    @level1 = Course.find_all_by_category_of_course(1).count
  end

  def compulsory
    @compulsory = Course.find_all_by_category_of_course(2).count
  end

  def level2courses
    @level2 = Course.find_all_by_category_of_course(3).count
  end

  def optional
    @optional = Course.find_all_by_category_of_course(4).count

  end


end
