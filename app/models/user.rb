class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

         validates :first_name,  presence: true
         validates :last_name,  presence: true
         validates :email, uniqueness: true

  
# User Avatar Validation
  validates_integrity_of  :image
  validates_processing_of :image

  has_many :request_user_id, class_name: 'Conversation', foreign_key: 'request_user_id'
  has_many :requests
  has_many :conversations
  has_many :messages
  

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end


end
