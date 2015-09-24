class Project < ActiveRecord::Base
    belongs_to :user
    has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '750x500'>
    }
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
end
