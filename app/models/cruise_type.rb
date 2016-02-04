class CruiseType < ActiveRecord::Base
  has_many :scheduled_cruises
  
  validates :name, length: { minimum: 5 }
  validate :validate_capacity
  
  # default_scope { where status: 'active' }
  
  private
  
  def validate_capacity
    if not (capacity and capacity > 0)
      errors.add(:capacity, "should be at least 1")
    end
  end
  
end
