class User < ActiveRecord::Base


  has_many :trainers
  has_many :employees
  belongs_to :branch
  authenticates_with_sorcery!





#  def send_activation_needed_email!
#end
#
#def send_activation_success_email!
#end

  attr_accessible :email, :password, :password_confirmation,:temp
  attr_accessor  :validatepin

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.search(search)
    if search
      where('email LIKE ? ', "%#{search}%")
    else
      scoped
    end
  end


end
