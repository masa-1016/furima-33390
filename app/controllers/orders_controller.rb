class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    #binding.pry
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal, :area_id, :city, :address, :building, :telephone).merge(token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end

