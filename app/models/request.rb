class Request < ApplicationRecord
    belongs_to :user

    validates_presense_of :title, :description, :latitude, :longitude, :user_id, :request_type
    validates :title, length { maximum: 50 }
    validates :description, length { maximum: 300 }
    valitates_inclusion_of :request_type, { in: allowed_types,
        message: "The request needs to be Material or Help"}
    # geocoded_by :address, :latitude => :lat, :longitude => :lng
    
    

end
