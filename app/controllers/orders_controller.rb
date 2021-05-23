class OrdersController < ApplicationController

  def index
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal, :area_id, :city, :address, :building, :telephone, item_id: params[:item_id])
  end

end

