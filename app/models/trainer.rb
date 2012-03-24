class Trainer < ActiveRecord::Base


  belongs_to   :branch
  belongs_to   :user
  has_many     :courses


  def self.search(search)
    if search
      where('firstname LIKE ? OR lastname like ?', "%#{search}%","%#{search}%")
    else
      scoped
    end
  end
end
