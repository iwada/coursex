class Branch < ActiveRecord::Base
   has_many  :users
   extend FriendlyId
   friendly_id :name

end
