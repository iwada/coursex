require 'faker'
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do

    99.times do |n|
      name  = Faker::Name.name
      date_of_course = "03/20/2012"
      time_of_course = "13:45"
      roomNumber = n +1
      tutor = "Mrs Engie Bashir"
      Category_of_course = 4
      description = "This is a Sample Dscription"
      duration = n +30
      maxallowed = n + 30;
      branchname = Faker::Name.name
      country = "United Arab Emirates"
      state = "Dubai"
      branchaddress= "MiddleSex University, Dubai"

      Course.create!(:name => name,
                   :date_of_course => date_of_course,
                   :time_of_course => time_of_course,
                   :roomnumber => n + 1,
                    :tutor => tutor,
                    :category_of_course => Category_of_course,
                    :description => description,
                    :duration=> duration,
                    :maxallowed => maxallowed,
                    :course_id => :id )

      Branch.create!(:name => branchname,
                     :country => country,
                     :branchstate => state,
                     :branchaddress => branchaddress)

    end
  end
end