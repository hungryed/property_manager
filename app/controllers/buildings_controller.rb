class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to root_path, notice: 'Building created successfully'
    else

    end
  end

  protected
  def building_params
    params.require(:building).permit(:address, :state, :city, :postal_code,
      :description, :owner_id)
  end
end
