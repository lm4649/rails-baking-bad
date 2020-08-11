class BakeriesController < ApplicationController

  def index
    @bakeries = Bakery.order(:name)
  end

  def show
    @bakery = Bakery.find(params[:id])
  end

  def new
    @bakery = Bakery.new
  end

  def create
    @bakery = Bakery.new(params_bakery)
    @bakery.user = current_user
    if @bakery.save
      redirect_to bakery_path(@bakery)
    else
      render :new

    end
  end

private

  def params_bakery
    params.require(bakery).permit(:name, :address, :phone_number, :description)
  end

end
