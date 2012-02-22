class Course < ActiveRecord::Base

  validates :name,  :presence => true,:length   => { :maximum => 50 }
  validates :description, :presence =>true
  validates :date_of_course, :presence =>true
  validates :roomnumber, :presence => true
  validates :category_of_course, :presence => true
  validates :maxallowed, :presence => true



end
