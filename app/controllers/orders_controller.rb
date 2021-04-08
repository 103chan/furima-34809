class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.index
  end

end
