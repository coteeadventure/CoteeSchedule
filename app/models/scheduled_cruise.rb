class ScheduledCruise < ActiveRecord::Base
  belongs_to :cruise_type
  has_many :reservations, -> { where status: 'active' }
  
  validates :cruise_type, presence: true
  validates :datetime, presence: true
  
  # default_scope { where status: 'active' }
  default_scope { order 'datetime ASC' }
  
  def datetime_pretty
    self.datetime.strftime '%A, %b %d at %l:%M %p'
  end
  
  def description_pretty
    # self.cruise_type.name + ': ' + datetime_pretty
    datetime_pretty + '—' + self.cruise_type.name
  end
  
  def booked_seats
    seats = 0
    reservations.each do |r|
      seats = seats + r.passengers_total
    end
    seats
  end
  
  def available_seats
    self.cruise_type.capacity - booked_seats
  end
    
  #TODO add time zone support
  #TODO only show cruises with enough seats - do this in controller
  def self.available(seats = 1)
    cruises = ScheduledCruise.where("datetime >= ?", Time.now)
    
    cruises.select do |c|
      c.available_seats >= seats
    end
  end
  
end
