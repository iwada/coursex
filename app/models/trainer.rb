class Trainer < ActiveRecord::Base


  belongs_to   :branch
  belongs_to   :user
  has_many     :courses


  has_attached_file :avatar, :styles => { :small => "150x150>" },
                    :storage => :s3,
                    #:bucket => ENV['S3_BUCKET_NAME'],
                    :bucket => "coursexdata",
                    :s3_credentials => {
                        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                        :secret_access_key => ENV['AWS_SECRET-ACCESS_KEY']
                    }


  def self.search(search)
    if search
      where('firstname LIKE ? OR lastname like ?', "%#{search}%","%#{search}%")
    else
      scoped
    end
  end
end
