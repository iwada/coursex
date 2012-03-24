class Employee < ActiveRecord::Base
  belongs_to   :branch
  belongs_to   :user
  has_many :progresses
  has_many :courses, :through => :progresses

# extend FriendlyId
#friendly_id :firstname


  def fetchCourses

    @acourses = Course.all

  end

  def self.search(search)
    if search
      where('firstname LIKE ? OR lastname like ?', "%#{search}%","%#{search}%")
    else
      scoped
    end
  end



end
