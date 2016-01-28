class CruiseTypesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @cruise_types = CruiseType.all
  end

  def new
    @cruise_type = CruiseType.new
  end
      
  def create
    @cruise_type = CruiseType.new (cruise_type_params)
 
    if @cruise_type.save
      redirect_to cruise_types_path
    else
      render 'new'
    end
  end
  
  def show
    @cruise_type = CruiseType.find(params[:id])
  end
  
  def edit
    @cruise_type = CruiseType.find(params[:id])
  end
     
  def update
    @cruise_type = CruiseType.find(params[:id])
 
    if @cruise_type.update(cruise_type_params)
      redirect_to cruise_types_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @cruise_type = CruiseType.find(params[:id])
    @cruise_type.status = 'deleted'
    @cruise_type.save
 
    redirect_to cruise_types_path
  end
 
  
private

  def cruise_type_params
    params.require(:cruise_type).permit(:name, :capacity)
  end
    
end
