class Course < ActiveRecord::Base


  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name
  #validates :name,  :presence => true,:length   => { :maximum => 50 }
  #validates :description, :presence =>true
  #validates :date_of_course, :presence =>true
  #validates :roomnumber, :presence => true
  #validates :category_of_course, :presence => true
  #validates :maxallowed, :presence => true

  has_many :progresses
  has_many :employees, :through => :progresses





end
