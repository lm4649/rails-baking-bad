class OrdersController < ApplicationController

  def create
    @bread = Bread.find(params[:bread_id])
    @order = Order.new(order_params)
    @order.bread = @bread
    @order.user = current_user
    @bakery = Baker.find(bread.bakery)
    authorize @order
    if @order.save
      redirect_to bakeries_path
    else
      redirect_to bakery_path(@bakery)
    end
  end


  def update
    # authorization : only for the baker
    @order = Order.find(params[:id])
    authorize @order
    @order.status = params[:status]
    raise
    if @order.save
      redirect_to dashboard_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:pick_up, :quantity, :status, :bread_id, :user_id)
  end
end
