class Accesspin < ActiveRecord::Base
  attr_accessor  :access_quantity
  attr_accessor  :expires

  before_create :create_pin



  def create_pin
    self.value =rand(10_000_000-1_000_000)+1_000_000
  end

  def self.search(search)
    if search
      where('value LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
