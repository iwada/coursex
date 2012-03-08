class Trainer < ActiveRecord::Base


  belongs_to   :branch
  belongs_to   :user
  has_many     :courses
end
