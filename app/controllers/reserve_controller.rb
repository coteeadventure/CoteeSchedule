class ReserveController < ApplicationController
  include Wicked::Wizard
  
  steps :passengers, :cruise, :customer, :confirmation
  
  def reset
    new_reservation
    redirect_to wizard_path steps.first
  end
  
  def show
    find_or_create_reservation
    
    render_wizard
  end
  
  def update
    find_or_create_reservation
    
    @reservation.status = if step == :customer
      'active' 
    else
      step.to_s
    end
    @reservation.update reservation_params
            
    render_wizard @reservation, reservation_id: @reservation.id
  end
  
  private
  
  def find_or_create_reservation
    if session[:reservation_id]
      @reservation = Reservation.find session[:reservation_id]
      
      
    else
      new_reservation
    end
    
    @wicked_step = step
    
    @params = params
  end
  
  def new_reservation
    @reservation = Reservation.create # status: 'new'
    session[:reservation_id] = @reservation.id
  end
  
  def reservation_params
    params.fetch(:reservation, {}).permit(:scheduled_cruise_id, :name, :address_line_1, :phone, :email, :coupon_code, :additional_information, :passengers_adults, :passengers_seniors, :passengers_kids, :passengers_babies)
  end
  
end