class BakeriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      # sql_query = " \
      #   bakeries.name @@ :query \
      #   OR bakeries.address @@ :query \
      #   OR bakeries.description @@ :query \
      #   OR breads.name @@ :query \
      #   OR breads.description @@ :query \
      # "
      # @bakeries = policy_scope(Bakery.geocoded).joins(:breads).where(sql_query, query: "%#{params[:query]}%").uniq

      @bakeries = policy_scope(Bakery.geocoded).global_search(params[:query])
      @results = "#{@bakeries.count} #{@bakeries.count > 1 ? 'results' : 'result'}"
    else
      @bakeries = policy_scope(Bakery.geocoded).order(:name)
      @results = "Your friendly neighborhood bakers"
    end

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
