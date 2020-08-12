class OrdersController < ApplicationController
  def new
    @order = Order.new
    @bread = Bread.find(params[:bread_id])
    authorize @bread
  end

  def create

    @bread = Bread.find(params[:bread_id])
    @order = Order.new(order_params)
    @order.bread = @bread
    @order.user = current_user
    @bakery = Bakery.find(@bread.bakery_id)
    @order.status = 1  # 0 = declined, 1 = pending, 2 = accepted, 3 = delivered
    authorize @order
    if @order.save
      redirect_to bakeries_path
    else
      redirect_to bakery_path(@bakery)
    end
  end

  def update
    # authorization : only for the baker
    authorize @order
    if @order.update(order_params)
      redirect_to dashboard_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:pick_up, :quantity, :status, :bread_id, :user_id)
  end
end
