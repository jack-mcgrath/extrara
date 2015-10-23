class Project < ActiveRecord::Base
    belongs_to :user

    has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '750x500>'
    }
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => "extrara-images"
end
