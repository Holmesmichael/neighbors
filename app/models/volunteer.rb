class Volunteer < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_many :messages
end
