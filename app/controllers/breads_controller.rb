class BreadsController < ApplicationController

  def new
    authorize @bread
    @bread = Bread.new
    @bakery = Bakery.find(params[:bakery_id])
  end

  def create
    @bread = Bread.new(bread_params)
    @bakery = Bakery.find(params[:bakery_id])
    @bread.bakery = @bakery
    authorize @bread
    if @bread.save
      redirect_to bakery_path(@bakery)
    else
      render :new
    end
  end

  private

  def bread_params
    params.require(:bread).permit(:price, :min_quantity, :max_quantity, :name, :bakery_id)
  end
end
