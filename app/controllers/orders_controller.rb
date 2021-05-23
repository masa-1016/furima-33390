class OrdersController < ApplicationController

  def index
    @order = Order.new(order_params)
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:postal, :area_id, :city, :address, :building, :telephone)
  end

end

