class UsersController < ApplicationController

  def dashboard
    @customer_orders = current_user.orders
    @baker_orders = current_user.bakery.breads.map { |bread| bread.orders }.flatten
  end

end
