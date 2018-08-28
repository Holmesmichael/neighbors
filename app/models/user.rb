class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # has_attached_file :id, styles: { medium: "300x300", thumb: "100x100" }

  has_many :requests
  has_many :conversations
  has_many :messages



end
