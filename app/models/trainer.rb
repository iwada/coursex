class Trainer < ActiveRecord::Base


  belongs_to   :branch
  belongs_to   :user
  has_many     :courses


  has_attached_file :avatar, :styles => { :small => "150x150>" }


  def self.search(search)
    if search
      where('firstname LIKE ? OR lastname like ?', "%#{search}%","%#{search}%")
    else
      scoped
    end
  end
end
