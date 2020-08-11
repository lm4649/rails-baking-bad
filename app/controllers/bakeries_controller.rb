class BakeriesController < ApplicationController

  def index
    @bakeries = Bakery.all
  end

  def show
    @bakery = Bakery.find(params[:id])
  end

  def new
    @bakery = Bakery.new
  end

  def create
    @bakery = Bakery.find(params_bakery)
  end

private

  def params_bakery
    params.require(bakery).permit(:name, :address, :phone_number, :description)
  end

end
