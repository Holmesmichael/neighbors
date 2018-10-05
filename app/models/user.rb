class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :ID, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :ID, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :ID, matches: [/png\z/, /jpe?g\z/]

  has_many :request_user_id, class_name: 'Conversation', foreign_key: 'request_user_id'
  has_many :requests
  has_many :conversations
  has_many :messages
  has_many :volunteers


end
