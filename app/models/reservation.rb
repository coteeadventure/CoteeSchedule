class Reservation < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  
  belongs_to :scheduled_cruise
  
  validate :validate_passenger_count, if: :active_or_passengers?
  
  validates :scheduled_cruise, presence:  { message: 'Please choose a cruise.' }, if: :active_or_cruise?
  
  with_options if: :active_or_customer? do |s|
    s.validates :name, length: { minimum: 5, message: 'Please type your full name.' }
    s.validates :address_line_1, presence: { message: 'Please type your address.' }
    s.validates :phone, presence: { message: 'Please type your phone number.' }
    s.validates :email, presence: { message: 'Please type your email address.' }
  end
    
  # default_scope { where status: 'active' }
  
  def confirmation_number
    id
  end
  
  def passengers_total
    passengers_adults +
    passengers_seniors +
    passengers_kids +
    passengers_babies
  end
  
  private
  
  def active?
    status == 'active'
  end
  
  def active_or_passengers?
    active? or status == 'passengers'
  end
  
  def active_or_cruise?
    active? or status == 'cruise'
  end
  
  def active_or_customer?
    active? or status == 'customer'
  end
  
  def validate_passenger_count
    if passengers_total == 0
      errors.add(:passengers_adults, "You must have at least one passenger.")
    elsif scheduled_cruise
    
      available = scheduled_cruise.available_seats
      
      if passengers_total > scheduled_cruise.available_seats
        word = if available == 1
          'is one seat'
        elsif available > 1
          "are #{available} seats"
        else
          "are no seats"
        end
        
        errors.add(:passengers_adults, "There #{word} remaining on this cruise—please choose a different cruise or reduce the number of passengers.")
      end
      
    end
  end
  
end
