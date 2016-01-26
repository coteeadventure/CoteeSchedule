class Reservation < ActiveRecord::Base
  belongs_to :scheduled_cruise
  
  validates :name, presence: true, length: { minimum: 5 }
  
  validates :address_line_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  
  validates :phone, presence: true
  
end
