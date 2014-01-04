class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    display_string = Owner.create_display_string(params[:owner])
    @owner = Owner.new(owner_params)
    @owner.display_string = display_string

    if @owner.save
      redirect_to root_path, notice: 'Owner created successfully'
    else
      render :new
    end
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def destroy
    @owner = Owner.find(params[:id])

    if @owner.destroy
      redirect_to owners_path, notice: 'Owner removed successfully'
    else
      redirect_to owners_path, notice: 'Owner not removed'
    end
  end

  protected
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :company, :email)
  end
end
