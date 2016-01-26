class CruiseType < ActiveRecord::Base
  has_many :scheduled_cruises
  
  validates :name, presence: true,
                      length: { minimum: 5 }
  validates :capacity, presence: true
end
