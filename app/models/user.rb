class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, dependent: :destroy
  has_attached_file :image, :styles => { :small => "64x64", :med => "100x100", :large => "200x200" },
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :path => ":attachment/:id/:style.:extension",
  :url => "http://extrara-images.s3.amazonaws.com/:attachment/:id/:style.:extension",
  :bucket => "extrara-images"
  
end
