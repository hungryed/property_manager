class BuildingsController < ApplicationController

  def new
    @building = Building.new
    @states = @building.only_us_states
  end

end
