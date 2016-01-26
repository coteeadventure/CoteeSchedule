class ScheduledCruise < ActiveRecord::Base
  belongs_to :cruise_type
  has_many :reservations
  
  validates :cruise_type, presence: true
  validates :datetime, presence: true
  
  def datetime_pretty
    self.datetime.strftime '%A, %b %d at %l:%M %p'
  end
  
  def description_pretty
    datetime_pretty + ': ' + self.cruise_type.name
  end
  
end
