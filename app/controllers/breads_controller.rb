class BreadsController < ApplicationController
  def new
    @bread = Bread.new
    @bakery = current_user.bakery
  end

  def create
    @bread = Bread.new(bread_params)
    @bakery = current_user.bakery
    @bread.bakery = @bakery
    if @bread.save
      redirect_to bakery_path(@bakery)
    else
      render :new
    end
  end

  private

  def bread_params
    params.require(:bread).permit(:price, :min_quantity, :max_quantity, :name, :photos)
  end
end
