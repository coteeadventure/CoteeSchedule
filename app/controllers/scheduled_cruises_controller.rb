class ScheduledCruisesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @scheduled_cruises = ScheduledCruise.all
  end

  def new
    @scheduled_cruise = ScheduledCruise.new
  end
      
  def create
    @scheduled_cruise = ScheduledCruise.new (scheduled_cruise_params)
 
    if @scheduled_cruise.save
      redirect_to scheduled_cruises_path
      #render text: params.inspect
    else
      render 'new'
    end
  end
  
  def show
    @scheduled_cruise = ScheduledCruise.find(params[:id])
  end
  
  def edit
    @scheduled_cruise = ScheduledCruise.find(params[:id])
  end
     
  def update
    @scheduled_cruise = ScheduledCruise.find(params[:id])
 
    if @scheduled_cruise.update(scheduled_cruise_params)
      redirect_to @scheduled_cruise
    else
      render 'edit'
    end
  end
  
  def destroy
    @scheduled_cruise = ScheduledCruise.find(params[:id])
    @scheduled_cruise.status = 'deleted'
    @scheduled_cruise.save
 
    redirect_to scheduled_cruises_path
  end
 
  
private

  def scheduled_cruise_params
    result = params.require(:scheduled_cruise).permit(:cruise_type_id, :datetime)
    result[:datetime] = Chronic.parse(result[:datetime])
    
    result
  end
end
