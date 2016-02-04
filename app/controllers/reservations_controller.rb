class ReservationsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @reservations = Reservation.where status: 'active'
  end
  
  def show
    get_reservation
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new reservation_params
 
    if @reservation.save
      redirect_to reservations_path
    else
      render 'new'
    end
  end
  
  def edit
    get_reservation
  end
  
  def update
    get_reservation
    
    if @reservation.update(reservation_params)
      redirect_to @reservation
    else
      render 'edit'
    end
  end
  
  def destroy
    get_reservation
    @reservation.status = 'deleted'
    @reservation.save
 
    redirect_to reservations_path
  end
  
  private
  
  def get_reservation
    @reservation = Reservation.find(params[:id])
  end
  
  def reservation_params
    params.require(:reservation).permit(:scheduled_cruise_id, :name, :address_line_1, :phone, :email, :coupon_code, :additional_information, :passengers_adults, :passengers_seniors, :passengers_kids, :passengers_babies)
  end
end
