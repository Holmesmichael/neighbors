class Request < ApplicationRecord
 
    belongs_to :user
    has_many :conversations
    # has_many :volunteers

    geocoded_by :address
    after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
    
    reverse_geocoded_by :latitude, :longitude
    after_validation :reverse_geocode

    valid_types = ['help', 'material']
    validates_presence_of :title, :description, :request_type
    validates :title, length: { maximum: 50 }
    validates :description, length: { maximum: 300 }
     
    def volunteered_by?(user)
        conversations.where(sender_id: user.id).any?
    end
   
    # enum done_value: {
    #     yes:  1,
    #     no:  0
    # }
   

end
