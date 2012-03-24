class Branch < ActiveRecord::Base
   has_many  :users
   extend FriendlyId
   friendly_id :name

   def self.search(search)
     if search
       where('name LIKE ? OR id LIKE ?', "%#{search}%" ,"%#{search}%")
     else
       scoped
     end
   end

end
