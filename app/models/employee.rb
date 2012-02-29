class Employee < ActiveRecord::Base
  belongs_to   :branch
  belongs_to   :user
  has_many :progresses
  has_many :courses, :through => :progresses


  def fetchCourses

    @acourses = Course.all

  end
end
