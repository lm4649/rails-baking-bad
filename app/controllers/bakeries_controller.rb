class BakeriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @bakeries = policy_scope(Bakery).order(:name)
    @bakeries = Bakery.geocoded # returns bakery with coordinates

    @markers = @bakeries.map do |bakery|
      {
        lat: bakery.latitude,
        lng: bakery.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bakery: bakery })
      }
    end
  end

  def show
    @bakery = Bakery.find(params[:id])
    authorize @bakery
  end

  def new
    @bakery = Bakery.new
    authorize @bakery
  end

  def create
    @bakery = Bakery.new(params_bakery)
    @bakery.user = current_user
    authorize @bakery
    if @bakery.save
      redirect_to bakery_path(@bakery)
    else
      render :new

    end
  end

  private

  def params_bakery
    params.require(:bakery).permit(:name, :address, :phone_number, :description, :photo)
  end
end
