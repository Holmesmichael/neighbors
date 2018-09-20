class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # has_attached_file :id, styles: { medium: "300x300", thumb: "100x100" }
  has_many :request_user_id, class_name: 'Conversation', foreign_key: 'request_user_id'
  has_many :requests
  has_many :conversations
  has_many :messages
  has_many :volunteers

 



end
