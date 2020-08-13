class UsersController < ApplicationController
  def dashboard
    @customer_orders = []
    @baker_orders = []
    # raise
    case params[:choice]
    when "0"
      @customer_orders = current_user.orders
    when "1"
      @baker_orders = current_user.bakery.breads.map { |bread| bread.orders }.flatten
    else
      @customer_orders = current_user.orders
    end
  end
end
