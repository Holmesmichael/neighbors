class Request < ApplicationRecord
    belongs_to :user

    validates :title, length { maximum: 50 }
    validates :description, length { maximum: 300 }
    

end
